import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:readingapps/configuration/di.dart';
import 'package:readingapps/main/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();
  final flutterTTS = getIt<FlutterTts>();
  await flutterTTS.setLanguage('ms-MY');
  runApp(App());
}
