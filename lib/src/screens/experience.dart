import 'package:flutter/material.dart';

import 'package:portfolio/src/utils/app_constants.dart';
import 'package:portfolio/src/utils/app_dimens.dart';
import 'package:portfolio/src/widgets/experiences_content.dart';
import 'package:portfolio/src/widgets/experiences_header.dart';
import 'package:portfolio/src/widgets/section_heading.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          label: AppConstants.experienceLabelTag,
          title: AppConstants.experienceTitle,
          subtitle: AppConstants.experienceSubtitle,
        ),
        const SizedBox(height: AppSpacing.lg),
        ListView.separated(
          shrinkWrap: true,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppConstants.experiences.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
          itemBuilder: (context, index) {
            final data = AppConstants.experiences[index];
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: ExperiencesHeader(experiences: data),
                  ),
                  const Divider(),
                  ExperiencesContent(designations: data.designations),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
