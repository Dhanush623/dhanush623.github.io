import 'package:flutter/material.dart';

import 'package:portfolio/src/utils/app_dimens.dart';

/// A [Card] that lifts and tints its border on hover. The portfolio is a web
/// build first, so pointer feedback is what tells visitors a card is a link.
class HoverCard extends StatefulWidget {
  const HoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.tooltip,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final String? tooltip;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final bool interactive = widget.onTap != null;
    final bool raised = interactive && _hovered;

    Widget card = AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      transform: Matrix4.translationValues(0, raised ? -4 : 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: raised
            ? [
                BoxShadow(
                  color: colors.shadow.withValues(alpha: 0.16),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ]
            : const [],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          side: BorderSide(
            color: raised ? colors.primary : colors.outlineVariant,
          ),
        ),
        child: InkWell(
          onTap: widget.onTap,
          onHover:
              interactive ? (value) => setState(() => _hovered = value) : null,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          child: Padding(padding: widget.padding, child: widget.child),
        ),
      ),
    );

    if (widget.tooltip != null) {
      card = Tooltip(message: widget.tooltip!, child: card);
    }
    return card;
  }
}
