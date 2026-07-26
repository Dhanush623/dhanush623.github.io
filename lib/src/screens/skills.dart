import 'package:flutter/material.dart';

import 'package:portfolio/src/services/url_service.dart';
import 'package:portfolio/src/utils/app_constants.dart';
import 'package:portfolio/src/utils/app_dimens.dart';
import 'package:portfolio/src/widgets/section_heading.dart';
import 'package:portfolio/src/widgets/skill_card.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          label: AppConstants.skillsLabel,
          title: AppConstants.skillsTitle,
          subtitle: AppConstants.skillsSubtitle,
        ),
        const SizedBox(height: AppSpacing.lg),
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppConstants.skillList.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 280,
            mainAxisExtent: 104,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
          ),
          itemBuilder: (context, index) {
            final skill = AppConstants.skillList[index];
            return SkillCard(
              skill: skill,
              onTap: skill.url == null
                  ? null
                  : () => UrlService().lanchUrl(skill.url!),
            );
          },
        ),
      ],
    );
  }
}
