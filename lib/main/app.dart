import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readingapps/configuration/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return _buildIsebaApp();
  }

  AdaptiveTheme _buildIsebaApp() {
    return AdaptiveTheme(
      light: _buildLightTheme(),
      dark: _buildDarkTheme(),
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) => _buildMaterialApp(light, dark),
    );
  }

  ThemeData _buildLightTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: GoogleFonts.andika().fontFamily,
      );

  ThemeData _buildDarkTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: Brightness.dark),
      );

  MaterialApp _buildMaterialApp(ThemeData light, ThemeData dark) {
    return MaterialApp.router(
      theme: light,
      darkTheme: dark,
      routerConfig: _appRouter.config(),
    );
  }
}
