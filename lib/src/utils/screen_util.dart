import 'package:flutter/widgets.dart';

import 'package:portfolio/src/utils/app_dimens.dart';

/// Breakpoints and layout helpers shared by every section.
class ScreenUtil {
  const ScreenUtil._();

  static const double mobileBreakpoint = 640;
  static const double tabletBreakpoint = 1024;

  /// The page never grows wider than this — long lines of text are hard to
  /// read and a full-bleed portfolio looks empty on large monitors.
  static const double maxContentWidth = 1120;

  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;

  static bool isMobile(BuildContext context) =>
      width(context) < mobileBreakpoint;

  static bool isDesktop(BuildContext context) =>
      width(context) >= tabletBreakpoint;

  /// Horizontal page padding, tighter on phones.
  static double horizontalPadding(BuildContext context) =>
      isMobile(context) ? AppSpacing.md : AppSpacing.lg;

  /// Vertical padding between two stacked sections.
  static double sectionSpacing(BuildContext context) =>
      isMobile(context) ? AppSpacing.xl : AppSpacing.xxl;
}
