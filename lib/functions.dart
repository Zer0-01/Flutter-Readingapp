import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:toastification/toastification.dart';

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

/// Displays a toast notification with an error message based on the specific Dio exception type and status code.
///
/// This function provides user-friendly error messages for different types of network request failures,
/// including timeout, connection, server, and authentication errors.
///
/// [context] The BuildContext used to display the toast notification.
/// [type] The specific type of Dio exception encountered during the network request.
/// [statusCode] The HTTP status code returned by the server (if applicable).
///
/// The toast notification includes a title and description that explains the nature of the error,
/// helping users understand what went wrong during the registration process.
void showErrorToast(
  BuildContext context,
  DioExceptionType type,
  int statusCode,
) {
  String title = "Request Failed";
  String description = "An unexpected error occurred.";

  switch (type) {
    case DioExceptionType.connectionTimeout:
      title = "Timeout";
      description = "Connection timed out. Please try again.";
      break;
    case DioExceptionType.sendTimeout:
      title = "Timeout";
      description = "Sending data took too long.";
      break;
    case DioExceptionType.receiveTimeout:
      title = "Timeout";
      description = "Server took too long to respond.";
      break;
    case DioExceptionType.connectionError:
      title = "Network Error";
      description = "No internet connection. Check your network settings.";
      break;
    case DioExceptionType.badCertificate:
      title = "Security Error";
      description = "Bad certificate detected. Cannot continue.";
      break;
    case DioExceptionType.cancel:
      title = "Cancelled";
      description = "Request was cancelled.";
      break;
    case DioExceptionType.badResponse:
      title = "Server Error";
      description = "Server responded with an error. Status code: $statusCode";
      break;
    case DioExceptionType.unknown:
      title = "Unknown Error";
      description = "Something went wrong. Please try again.";
      break;
  }

  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.flat,
    title: Text(title),
    description: Text(description),
    alignment: Alignment.bottomCenter,
    autoCloseDuration: const Duration(seconds: 4),
    borderRadius: BorderRadius.circular(12.0),
  );
}

enum InputBorderType {
  enabled,
  focused,
  error,
}

InputBorder getInputBorder(
    {required InputBorderType type, required BuildContext context}) {
  switch (type) {
    case InputBorderType.enabled:
      return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: context.theme.hintColor,
          width: 1,
        ),
      );
    case InputBorderType.focused:
      return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: context.theme.focusColor,
          width: 1,
        ),
      );
    case InputBorderType.error:
      return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1,
        ),
      );
  }
}
