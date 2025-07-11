import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'main_navigation.dart';
import 'shared/widgets/celestial_background.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Connect LMS',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const CelestialBackground(child: MainNavigationScreen()),
    );
  }
}
