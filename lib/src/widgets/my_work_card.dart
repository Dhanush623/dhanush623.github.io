import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portfolio/src/models/my_work.dart';
import 'package:portfolio/src/services/url_service.dart';
import 'package:portfolio/src/utils/app_dimens.dart';
import 'package:portfolio/src/widgets/custom_image_loader.dart';
import 'package:portfolio/src/widgets/hover_card.dart';

class MyWorkCard extends StatelessWidget {
  const MyWorkCard({super.key, required this.myWork});

  final MyWork myWork;

  WorkLink? get _primaryLink =>
      myWork.links.isEmpty ? null : myWork.links.first;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final WorkLink? primary = _primaryLink;

    return HoverCard(
      onTap: primary == null ? null : () => UrlService().lanchUrl(primary.url),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomImageLoader(imageUrl: myWork.image ?? '', size: 44),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  myWork.title,
                  style: theme.textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            myWork.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: myWork.techStack
                .map(
                  (tech) => Chip(
                    label: Text(tech),
                    visualDensity: VisualDensity.compact,
                  ),
                )
                .toList(),
          ),
          const Spacer(),
          const SizedBox(height: AppSpacing.sm),
          // Links sit on the card's baseline so every card lines up, no
          // matter how long the description or how many chips.
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.xs,
            children: myWork.links
                .map((link) => _WorkLinkButton(link: link))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _WorkLinkButton extends StatelessWidget {
  const _WorkLinkButton({required this.link});

  final WorkLink link;

  FaIconData get _icon => switch (link.kind) {
        WorkLinkKind.application => FontAwesomeIcons.googlePlay,
        WorkLinkKind.source => FontAwesomeIcons.github,
        WorkLinkKind.article => FontAwesomeIcons.linkedin,
      };

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return TextButton.icon(
      onPressed: () => UrlService().lanchUrl(link.url),
      style: TextButton.styleFrom(
        foregroundColor: theme.colorScheme.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        visualDensity: VisualDensity.compact,
      ),
      icon: FaIcon(_icon, size: 14),
      label: Text(
        link.label,
        style: theme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
