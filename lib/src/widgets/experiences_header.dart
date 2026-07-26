import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:portfolio/src/models/experience_item.dart';
import 'package:portfolio/src/services/date_service.dart';
import 'package:portfolio/src/utils/app_colors.dart';
import 'package:portfolio/src/utils/app_constants.dart';
import 'package:portfolio/src/utils/app_dimens.dart';
import 'package:portfolio/src/utils/screen_util.dart';

class ExperiencesHeader extends StatelessWidget {
  const ExperiencesHeader({super.key, required this.experiences});

  final ExperienceItem experiences;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isMobile = ScreenUtil.isMobile(context);
    final String range =
        '${DateFormat(AppConstants.dateFormat).format(experiences.startDate)} — '
        '${experiences.endDate != null ? DateFormat(AppConstants.dateFormat).format(experiences.endDate!) : AppConstants.current}';
    final String duration = DateService().formatDuration(
      experiences.startDate,
      experiences.endDate,
    );

    final Widget identity = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CompanyMonogram(name: experiences.companyName),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                experiences.companyName,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                experiences.mode,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final Widget dates = Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          range,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          duration,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          identity,
          const SizedBox(height: AppSpacing.sm),
          dates,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: identity),
        const SizedBox(width: AppSpacing.md),
        dates,
      ],
    );
  }
}

class _CompanyMonogram extends StatelessWidget {
  const _CompanyMonogram({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        gradient: LinearGradient(
          colors: AppColors.brandGradient
              .map((color) => color.withValues(alpha: 0.16))
              .toList(),
        ),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Text(
        name.isEmpty ? '?' : name[0].toUpperCase(),
        style: theme.textTheme.titleMedium?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
