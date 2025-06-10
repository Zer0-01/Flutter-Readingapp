import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerSingleton<FlutterTts>(FlutterTts());
}
