import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timelines_plus/timelines_plus.dart';

import 'package:portfolio/src/models/experience_item.dart';
import 'package:portfolio/src/services/date_service.dart';
import 'package:portfolio/src/utils/app_constants.dart';
import 'package:portfolio/src/utils/app_dimens.dart';
import 'package:portfolio/src/utils/screen_util.dart';

class ExperiencesContent extends StatelessWidget {
  const ExperiencesContent({super.key, required this.designations});

  final List<Designation> designations;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          indicatorTheme: const IndicatorThemeData(position: 0, size: 14.0),
          connectorTheme: ConnectorThemeData(
            thickness: 2,
            color: colors.outlineVariant,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: designations.length,
          contentsBuilder: (_, index) => Padding(
            padding: EdgeInsets.only(
              left: AppSpacing.md,
              bottom: index == designations.length - 1 ? 0 : AppSpacing.lg,
            ),
            child: _DesignationTile(
              designation: designations[index],
              isCurrent: index == 0 && designations[index].endDate == null,
            ),
          ),
          indicatorBuilder: (_, index) => DotIndicator(
            size: index == 0 ? 14 : 10,
            color: index == 0 ? colors.primary : colors.outline,
          ),
          connectorBuilder: (_, __, ___) => SolidLineConnector(
            color: colors.outlineVariant,
          ),
        ),
      ),
    );
  }
}

class _DesignationTile extends StatelessWidget {
  const _DesignationTile({required this.designation, required this.isCurrent});

  final Designation designation;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isMobile = ScreenUtil.isMobile(context);
    final String range =
        '${DateFormat(AppConstants.dateFormat).format(designation.startDate)} — '
        '${designation.endDate != null ? DateFormat(AppConstants.dateFormat).format(designation.endDate!) : AppConstants.current}';

    final Widget role = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(designation.role, style: theme.textTheme.titleMedium),
        ),
        if (isCurrent) ...[
          const SizedBox(width: AppSpacing.sm),
          const _CurrentBadge(),
        ],
      ],
    );

    final Widget dates = Text(
      '$range · ${DateService().formatDuration(designation.startDate, designation.endDate)}',
      style: theme.textTheme.labelMedium?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
      textAlign: isMobile ? TextAlign.start : TextAlign.end,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isMobile) ...[
          role,
          const SizedBox(height: AppSpacing.xs),
          dates,
        ] else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: role),
              const SizedBox(width: AppSpacing.md),
              dates,
            ],
          ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '${designation.mode} · ${designation.location}',
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        if (designation.description != null) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(designation.description!, style: theme.textTheme.bodyMedium),
        ],
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: designation.skills
              .map(
                (skill) => Chip(
                  label: Text(skill),
                  visualDensity: VisualDensity.compact,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _CurrentBadge extends StatelessWidget {
  const _CurrentBadge();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        AppConstants.current,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
