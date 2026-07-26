import 'package:flutter/material.dart';

import 'package:portfolio/src/services/url_service.dart';
import 'package:portfolio/src/utils/app_constants.dart';
import 'package:portfolio/src/utils/app_dimens.dart';
import 'package:portfolio/src/widgets/my_work_card.dart';
import 'package:portfolio/src/widgets/section_heading.dart';

class MyWorks extends StatelessWidget {
  const MyWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          label: AppConstants.myWorksLabel,
          title: AppConstants.myWorksTitle,
          subtitle: AppConstants.myWorksSubtitle,
        ),
        const SizedBox(height: AppSpacing.lg),
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppConstants.myWorkList.length,
          // A max extent plus a fixed row height keeps every card the same
          // size at any window width, instead of squashing the aspect ratio.
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 340,
            mainAxisExtent: 104,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
          ),
          itemBuilder: (context, index) {
            final myWork = AppConstants.myWorkList[index];
            return MyWorkCard(
              myWork: myWork,
              onTap: myWork.source == null
                  ? null
                  : () => UrlService().lanchUrl(myWork.source!),
            );
          },
        ),
      ],
    );
  }
}
