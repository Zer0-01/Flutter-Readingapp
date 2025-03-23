import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:readingapps/configuration/di.dart';
import 'package:readingapps/constants.dart';

part 'reading_event.dart';
part 'reading_state.dart';

class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  ReadingBloc() : super(const ReadingState(country: CountryEnum.malaysia)) {
    on<OnPressedSeterusnyaEvent>(_onPressedSeterusnaEvent);
    on<OnPressedPadamEvent>(_onPressedPadamEvent);
    on<OnPressedMainkanPerkataanEvent>(_onPressedMainkanPerkataanEvent);
    on<OnPressedSyllableEvent>(_onPressedSyllableEvent);
    on<OnSelectLanguageEvent>(_onSelectLanguageEvent);
  }

  void _onPressedSeterusnaEvent(
    OnPressedSeterusnyaEvent event,
    Emitter<ReadingState> emit,
  ) {
    getIt<FlutterTts>().speak(event.syllable);

    emit(state.copyWith(syllables: [...state.syllables, event.syllable]));
  }

  void _onPressedPadamEvent(
    OnPressedPadamEvent event,
    Emitter<ReadingState> emit,
  ) {
    emit(state.copyWith(syllables: []));
  }

  void _onPressedMainkanPerkataanEvent(
    OnPressedMainkanPerkataanEvent event,
    Emitter<ReadingState> emit,
  ) {
    getIt<FlutterTts>().speak(state.syllables.join(''));
  }

  void _onPressedSyllableEvent(
    OnPressedSyllableEvent event,
    Emitter<ReadingState> emit,
  ) {
    getIt<FlutterTts>().speak(event.syllable);
  }

  void _onSelectLanguageEvent(
    OnSelectLanguageEvent event,
    Emitter<ReadingState> emit,
  ) {
    emit(state.copyWith(country: event.country));
  }
}
