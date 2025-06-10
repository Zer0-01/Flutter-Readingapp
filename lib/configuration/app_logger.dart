import 'package:logger/logger.dart';

enum LogFormat { simple, extended }

/// Configures the application logger with specified settings.
///
/// [isProduction] determines the logging level and filter strategy.
/// [logToFile] is currently unused but reserved for future file logging implementation.
/// [logFormat] allows selecting between simple and extended log output formats.
///
/// The method sets up logging configuration globally for the application:
/// - In production, sets log level to [Level.info]
/// - In development, sets log level to [Level.debug]
/// - Configures log printer based on selected [LogFormat]
/// - Uses console output by default
/// - Applies appropriate filter based on environment
class AppLogger {
  static late Logger _logger;
  static late Level _level;
  static late LogFormat _logFormat;
  late String _name;

  AppLogger() {
    _name = "Logger";
  }

  AppLogger.getLogger(String name) {
    _name = name;
  }

  static void configure() {
    _logger = Logger(printer: PrettyPrinter(methodCount: 0));
  }

  String _msg(dynamic message, [List<dynamic>? args]) {
    String msg = "$_name : $message";
    if (args != null) {
      for (int i = 0; i < args.length; i++) {
        msg = msg.replaceFirst("{}", args[i].toString());
      }
    }
    return msg;
  }

  void trace(dynamic message, [List<Object?>? args]) =>
      _logger.t(_msg(message, args));

  void debug(dynamic message, [List<Object?>? args]) =>
      _logger.d(_msg(message, args));

  void info(dynamic message, [List<Object?>? args]) =>
      _logger.i(_msg(message, args));

  void warn(dynamic message, [List<Object?>? args]) =>
      _logger.w(_msg(message, args));

  void error(dynamic message, [List<Object?>? args]) =>
      _logger.e(_msg(message, args));

  @override
  String toString() {
    return "AppLogger($_name, ${_level.name}, ${_logFormat.name})";
  }
}
