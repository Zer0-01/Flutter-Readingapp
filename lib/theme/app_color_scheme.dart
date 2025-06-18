import 'package:flutter/material.dart';

class AppColorScheme {
  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF1976D2), // Blue 700
    onPrimary: Color(0xFFFFFFFF), // White text/icons on primary
    primaryContainer: Color(0xFFBBDEFB), // Blue 100
    onPrimaryContainer: Color(0xFF0D47A1), // Deep blue for contrast
    secondary: Color(0xFF64B5F6), // Blue 300
    onSecondary: Color(0xFF000000),
    secondaryContainer: Color(0xFFE3F2FD), // Light blue
    onSecondaryContainer: Color(0xFF0D47A1),
    tertiary: Color(0xFFFFC107), // Amber
    onTertiary: Color(0xFF000000),
    tertiaryContainer: Color(0xFFFFECB3), // Amber 100
    onTertiaryContainer: Color(0xFF000000),
    error: Color(0xFFB00020),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFCDD2), // Light red
    onErrorContainer: Color(0xFFB00020),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF121212),
    surfaceContainerHighest: Color(0xFFE0E0E0), // Grey 300 — cards and surfaces
    onSurfaceVariant: Color(0xFF37474F),
    outline: Color(0xFF90A4AE), // Light grey-blue outline
    inverseSurface: Color(0xFF121212), // Dark surface for snackbar/toasts
    onInverseSurface: Color(0xFFE0E0E0),
    inversePrimary: Color(0xFF90CAF9), // Blue 200
    shadow: Color(0xFF000000), // Standard black shadow
    surfaceTint: Color(0xFF1976D2),
  );

  static const ColorScheme dark = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF1976D2), // Blue 700
      onPrimary: Color(0xFFFFFFFF), // White text/icons on primary
      primaryContainer: Color(0xFF0D47A1), // Darker blue for containers
      onPrimaryContainer: Color(0xFFFFFFFF),
      secondary: Color(0xFF64B5F6), // Blue 300
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFF1565C0), // Slightly deeper blue
      onSecondaryContainer: Color(0xFFFFFFFF),
      tertiary: Color(0xFFFFC107), // Amber (for accent elements)
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFFFFD54F), // Lighter amber
      onTertiaryContainer: Color(0xFF000000),
      error: Color(0xFFCF6679), // Red A200 (recommended for dark)
      onError: Color(0xFF000000),
      errorContainer: Color(0xFFB00020),
      onErrorContainer: Color(0xFFFFFFFF),
      surface: Color(0xFF1E1E1E), // Slightly lighter than background
      onSurface: Color(0xFFE0E0E0),
      surfaceContainerHighest: Color(0xFF37474F), // Used for cards, surfaces
      onSurfaceVariant: Color(0xFFB0BEC5),
      outline: Color(0xFF78909C), // Border/stroke color
      inverseSurface: Color(0xFFE0E0E0), // Light surface in dark mode
      onInverseSurface: Color(0xFF1E1E1E),
      inversePrimary:
          Color(0xFF90CAF9), // Blue 200 — lighter inverse of primary
      shadow: Color(0xFF000000), // Shadows always black in dark
      surfaceTint: Color(0xFF1976D2)); // Usually matches primary
}
