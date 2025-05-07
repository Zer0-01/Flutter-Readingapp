import 'dart:math';
import 'package:flutter/material.dart';

/// Generates a random opaque color with random RGB values.
///
/// Returns a [Color] with fully opaque alpha (255) and randomly selected
/// red, green, and blue color channel values between 0 and 255.
///
/// Example:
///
///   Color randomColor = getRandomColor(); // Might return Color.fromARGB(255, 123, 45, 67)
///
Color getRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}
