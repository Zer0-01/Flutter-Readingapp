import 'package:flutter/widgets.dart';
import 'package:readingapps/configuration/app_logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.configure(isProduction: true);
}
