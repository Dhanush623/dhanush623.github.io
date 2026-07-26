/// Spacing scale. Every gap in the app should come from here so the vertical
/// rhythm stays consistent between sections.
class AppSpacing {
  const AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 40;
  static const double xxl = 72;
}

/// Corner radii. Cards use [lg], inner elements use [sm]/[md].
class AppRadius {
  const AppRadius._();

  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double pill = 999;
}
