import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Extension methods on [BuildContext] to provide localization access.
///
/// Allows easy retrieval of localized strings using the app's [AppLocalizations]
/// instance directly from a [BuildContext].
///
/// Example:
///
/// // Get a localized string
/// String greeting = context.loc.hello;
///
extension LocalizationExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}

/// Extension methods on [BuildContext] to provide convenient access to screen dimensions.
///
/// Allows calculating screen width, height, and percentage-based dimensions
/// for responsive layout and sizing in Flutter applications.
///
/// Example:
///
/// // Get full screen width
/// double width = context.screenWidth;
///
/// // Calculate 50% of screen height
/// double halfHeight = context.heightPct(50);
///
extension ScreenSizeExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double heightPct(double percent) => screenHeight * (percent / 100);
  double widthPct(double percent) => screenWidth * (percent / 100);
}
