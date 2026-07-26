import 'package:flutter/material.dart';

import 'package:portfolio/src/utils/app_colors.dart';
import 'package:portfolio/src/utils/app_dimens.dart';

/// The heading every section shares: a small accent label, a large title and
/// an optional one line description.
class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.label,
    required this.title,
    this.subtitle,
  });

  final String label;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.pill),
                gradient: const LinearGradient(colors: AppColors.brandGradient),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              label.toUpperCase(),
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(title, style: theme.textTheme.headlineMedium),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            subtitle!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}
