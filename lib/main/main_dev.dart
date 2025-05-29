import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:readingapps/configuration/app_environment.dart';
import 'package:readingapps/configuration/app_logger.dart';
import 'package:readingapps/configuration/app_di.dart';
import 'package:readingapps/configuration/app_local_storage.dart';
import 'package:readingapps/constants.dart';
import 'package:readingapps/main/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.configure();
  ProfileConstants.setEnvironment(Environment.dev);
  AppLocalStorage().setStorage(StorageType.sharedPreferences);
  final String defaultLanguage =
      await AppLocalStorage().read(StorageKeys.language.name) ??
          CountryEnum.malaysia.languageCode;
  final String defaultTTSLanguage =
      await AppLocalStorage().read(StorageKeys.textToSpeech.name) ??
          CountryEnum.malaysia.textToSpeech;
  setupDI();
  final flutterTTS = getIt<FlutterTts>();
  await flutterTTS.setLanguage(defaultTTSLanguage);
  FlutterNativeSplash.remove();
  runApp(App(
    defaultLanguage: defaultLanguage,
  ));
}
