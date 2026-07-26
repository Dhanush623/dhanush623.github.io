import 'package:flutter/material.dart';

import 'package:portfolio/src/utils/app_constants.dart';
import 'package:portfolio/src/utils/app_dimens.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? style = theme.textTheme.labelLarge?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(height: AppSpacing.lg),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: AppSpacing.sm,
            spacing: AppSpacing.md,
            children: [
              Text(
                '${AppConstants.copyright}${DateTime.now().year}',
                style: style,
              ),
              Text(AppConstants.builtMessage, style: style),
            ],
          ),
        ),
      ],
    );
  }
}
