import 'dart:math';
import 'package:flutter/material.dart';

/// Generates a random color based on the specified [type].
///
/// [type] determines the color generation strategy:
/// - [ColorType.defaultColor]: Generates a completely random color
/// - [ColorType.pastel]: Generates a soft, light-toned color
/// - [ColorType.bold]: Selects a color from a predefined list of vibrant colors
///
/// Returns a [Color] object representing the randomly generated color.
enum ColorType { defaultColor, pastel, bold }

Color getRandomColor({ColorType type = ColorType.defaultColor}) {
  final Random random = Random();

  switch (type) {
    case ColorType.pastel:
      return Color.fromARGB(
        255,
        200 + random.nextInt(56),
        200 + random.nextInt(56),
        200 + random.nextInt(56),
      );

    case ColorType.bold:
      List<Color> boldColors = [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.orange,
        Colors.purple,
        Colors.pink,
        Colors.yellow,
        Colors.cyan,
        Colors.indigo,
        Colors.teal,
      ];
      return boldColors[random.nextInt(boldColors.length)];

    case ColorType.defaultColor:
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
  }
}
