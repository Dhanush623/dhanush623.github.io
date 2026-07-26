import 'package:flutter/material.dart';

import 'package:portfolio/src/utils/screen_util.dart';

/// Centres its child and caps it at [ScreenUtil.maxContentWidth] so the page
/// stays readable on wide monitors.
class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: ScreenUtil.maxContentWidth,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil.horizontalPadding(context),
          ),
          child: child,
        ),
      ),
    );
  }
}
