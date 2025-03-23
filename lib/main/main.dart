import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:readingapps/configuration/di.dart';
import 'package:readingapps/configuration/local_storage.dart';
import 'package:readingapps/constants.dart';
import 'package:readingapps/main/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
