import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(
    MyApp(
      savedThemeMode: savedThemeMode,
    ),
  );
}
