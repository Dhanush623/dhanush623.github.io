import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portfolio/src/models/experience_item.dart';
import 'package:portfolio/src/services/date_service.dart';
import 'package:portfolio/src/services/url_service.dart';
import 'package:portfolio/src/utils/app_colors.dart';
import 'package:portfolio/src/utils/app_constants.dart';
import 'package:portfolio/src/utils/app_dimens.dart';
import 'package:portfolio/src/utils/screen_util.dart';
import 'package:portfolio/src/widgets/fade_slide_in.dart';

/// Landing hero: who I am, what I do right now, and how to reach me.
class Intro extends StatelessWidget {
  const Intro({super.key, this.onContactPressed});

  /// Scrolls the page to the contact section.
  final VoidCallback? onContactPressed;

  @override
  Widget build(BuildContext context) {
    final Widget details = _Details(onContactPressed: onContactPressed);

    return FadeSlideIn(
      child: ScreenUtil.isMobile(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Avatar(),
                const SizedBox(height: AppSpacing.lg),
                details,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: details),
                const SizedBox(width: AppSpacing.xl),
                const _Avatar(),
              ],
            ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({this.onContactPressed});

  final VoidCallback? onContactPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isMobile = ScreenUtil.isMobile(context);
    final ExperienceItem current = AppConstants.experiences.first;
    final String role = current.designations.first.role;
    final String tenure = DateService().formatDuration(
      AppConstants.startDate,
      null,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.greeting,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          AppConstants.name,
          style: isMobile
              ? theme.textTheme.headlineMedium
              : theme.textTheme.displaySmall,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          '$role · ${current.companyName}',
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            AppConstants.aboutMessage,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            _MetaChip(icon: Icons.timeline_rounded, label: tenure),
            const _MetaChip(
              icon: Icons.place_outlined,
              label: AppConstants.basedIn,
            ),
            const _MetaChip(
              icon: Icons.work_outline_rounded,
              label: AppConstants.modeFullTime,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            FilledButton.icon(
              onPressed: onContactPressed,
              icon: const Icon(Icons.mail_outline_rounded, size: 18),
              label: const Text(AppConstants.getInTouch),
            ),
            OutlinedButton.icon(
              onPressed: () => UrlService()
                  .lanchUrl('https://github.com/${AppConstants.githubId}'),
              icon: const FaIcon(FontAwesomeIcons.github, size: 16),
              label: const Text(AppConstants.viewGithub),
            ),
            OutlinedButton.icon(
              onPressed: () => UrlService().lanchUrl(
                'https://www.linkedin.com/in/${AppConstants.linkedInId}',
              ),
              icon: const FaIcon(FontAwesomeIcons.linkedinIn, size: 16),
              label: const Text(AppConstants.viewLinkedIn),
            ),
          ],
        ),
      ],
    );
  }
}

/// Initials inside a gradient ring — there is no profile photo in assets, and
/// a monogram scales better than a placeholder image anyway.
class _Avatar extends StatelessWidget {
  const _Avatar();

  String get _initials => AppConstants.name
      .split(' ')
      .where((part) => part.isNotEmpty)
      .take(2)
      .map((part) => part[0].toUpperCase())
      .join();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double size = ScreenUtil.isMobile(context) ? 104 : 200;

    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: AppColors.brandGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.colorScheme.surfaceContainerLow,
        ),
        alignment: Alignment.center,
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: AppColors.brandGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            _initials,
            style: (size > 120
                    ? theme.textTheme.displayMedium
                    : theme.textTheme.headlineMedium)
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Chip(
      avatar: Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant),
      label: Text(label),
      visualDensity: VisualDensity.compact,
    );
  }
}
