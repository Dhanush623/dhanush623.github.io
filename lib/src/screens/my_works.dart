import 'package:flutter/material.dart';

import 'package:portfolio/src/utils/app_constants.dart';
import 'package:portfolio/src/utils/app_dimens.dart';
import 'package:portfolio/src/widgets/my_work_card.dart';
import 'package:portfolio/src/widgets/responsive_card_grid.dart';
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
        ResponsiveCardGrid(
          children: AppConstants.myWorkList
              .map((myWork) => MyWorkCard(myWork: myWork))
              .toList(),
        ),
      ],
    );
  }
}
