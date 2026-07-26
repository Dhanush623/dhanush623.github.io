import 'package:flutter/material.dart';

import 'package:portfolio/src/models/my_work.dart';
import 'package:portfolio/src/utils/app_dimens.dart';
import 'package:portfolio/src/widgets/custom_image_loader.dart';
import 'package:portfolio/src/widgets/hover_card.dart';

class MyWorkCard extends StatelessWidget {
  const MyWorkCard({super.key, required this.myWork, this.onTap});

  final MyWork myWork;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return HoverCard(
      onTap: onTap,
      tooltip: myWork.source,
      child: Row(
        children: [
          CustomImageLoader(imageUrl: myWork.image ?? '', size: 44),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  myWork.title,
                  style: theme.textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.xs),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        myWork.buttonName ?? '',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Icon(
                      Icons.arrow_outward_rounded,
                      size: 14,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
