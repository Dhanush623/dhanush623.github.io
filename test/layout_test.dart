// Renders the whole page at a phone and a desktop width. Any RenderFlex
// overflow or layout assertion fails the test, which is the class of bug the
// responsive grids and headers are most likely to regress into.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio/src/screens/dashboard.dart';
import 'package:portfolio/src/utils/app_constants.dart';
import 'package:portfolio/src/utils/app_theme.dart';

Future<void> _pumpDashboard(WidgetTester tester, Size size) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    MaterialApp(theme: AppTheme.light(), home: const Dashboard()),
  );
  await tester.pumpAndSettle();
}

void main() {
  group('Dashboard layout', () {
    testWidgets('lays out on a phone', (tester) async {
      await _pumpDashboard(tester, const Size(390, 844));

      expect(find.text(AppConstants.name), findsWidgets);
      expect(find.byType(Drawer), findsNothing); // closed, but available
    });

    testWidgets('lays out on a desktop', (tester) async {
      await _pumpDashboard(tester, const Size(1440, 900));

      expect(find.text(AppConstants.name), findsWidgets);
      // Every menu entry is rendered as a nav item in the app bar.
      for (final item in AppConstants.menuList) {
        expect(find.text(item.title), findsWidgets);
      }
    });

    testWidgets('shows a description and tech stack per project', (
      tester,
    ) async {
      await _pumpDashboard(tester, const Size(1440, 900));

      for (final work in AppConstants.myWorkList) {
        expect(find.text(work.description), findsOneWidget);
        for (final tech in work.techStack) {
          expect(find.text(tech), findsWidgets);
        }
        for (final link in work.links) {
          expect(find.text(link.label), findsWidgets);
        }
      }
    });

    testWidgets('lays out at an awkward tablet width', (tester) async {
      await _pumpDashboard(tester, const Size(768, 1024));

      expect(find.text(AppConstants.aboutTitle), findsNothing);
      expect(find.text(AppConstants.skillsTitle), findsOneWidget);
    });
  });
}
