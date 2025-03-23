import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:readingapps/configuration/di.dart';
import 'package:readingapps/constants.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({required String language})
      : super(LanguageState(language: language)) {
    on<OnChangedLanguageEvent>(_onChangedLanguageEvent);
  }

  void _onChangedLanguageEvent(
      OnChangedLanguageEvent event, Emitter<LanguageState> emit) async {
    final FlutterTts flutterTts = getIt<FlutterTts>();
    await flutterTts.setLanguage(event.language.textToSpeech);
    emit(state.copyWith(language: event.language.languageCode));
  }
}
