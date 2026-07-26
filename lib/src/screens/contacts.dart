import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portfolio/src/services/url_service.dart';
import 'package:portfolio/src/utils/app_constants.dart';
import 'package:portfolio/src/utils/app_dimens.dart';
import 'package:portfolio/src/widgets/contact_icon_button.dart';
import 'package:portfolio/src/widgets/section_heading.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    final UrlService urlService = UrlService();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          label: AppConstants.contactLabel,
          title: AppConstants.contactTitle,
          subtitle: AppConstants.contactSubtitle,
        ),
        const SizedBox(height: AppSpacing.lg),
        GridView(
          shrinkWrap: true,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 340,
            mainAxisExtent: 88,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
          ),
          children: [
            ContactIconButton(
              icon: FontAwesomeIcons.envelope,
              label: AppConstants.email,
              value: AppConstants.emailId,
              handle: () => urlService.lanchUrl(
                'mailto:${AppConstants.emailId}',
              ),
            ),
            ContactIconButton(
              icon: FontAwesomeIcons.mobileScreen,
              label: AppConstants.phone,
              value: AppConstants.mobileNumber,
              handle: () => urlService.lanchUrl(
                'tel:${AppConstants.mobileNumber}',
              ),
            ),
            ContactIconButton(
              icon: FontAwesomeIcons.github,
              label: AppConstants.github,
              value: '@${AppConstants.githubId}',
              handle: () => urlService.lanchUrl(
                'https://github.com/${AppConstants.githubId}',
              ),
            ),
            ContactIconButton(
              icon: FontAwesomeIcons.linkedinIn,
              label: AppConstants.linkedIn,
              value: AppConstants.linkedInId,
              handle: () => urlService.lanchUrl(
                'https://www.linkedin.com/in/${AppConstants.linkedInId}',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
