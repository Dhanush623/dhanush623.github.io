import 'package:flutter/material.dart';

import 'package:portfolio/src/models/skill.dart';
import 'package:portfolio/src/utils/app_dimens.dart';
import 'package:portfolio/src/widgets/custom_image_loader.dart';
import 'package:portfolio/src/widgets/hover_card.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({super.key, required this.skill, this.onTap});

  final Skill skill;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return HoverCard(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomImageLoader(imageUrl: skill.iconUrl, size: 32),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  skill.title,
                  style: theme.textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${skill.score.round()}%',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          // A plain themed progress bar: no fixed pixel width, so it can never
          // overflow its card the way the old indicator did.
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: LinearProgressIndicator(
              value: (skill.score / 100).clamp(0, 1),
              minHeight: 6,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(
                theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
