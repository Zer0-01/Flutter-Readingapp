import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readingapps/configuration/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  final String defaultLanguage;

  App({super.key, required this.defaultLanguage});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return _buildIsebaApp(defaultLanguage);
  }

  AdaptiveTheme _buildIsebaApp(String defaultLanguage) {
    return AdaptiveTheme(
      light: _buildLightTheme(),
      dark: _buildDarkTheme(),
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) => _buildMaterialApp(light, dark, defaultLanguage),
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

  MaterialApp _buildMaterialApp(
      ThemeData light, ThemeData dark, String defaultLanguage) {
    return MaterialApp.router(
      theme: light,
      darkTheme: dark,
      routerConfig: _appRouter.config(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(defaultLanguage),
      debugShowCheckedModeBanner: false,
    );
  }
}
