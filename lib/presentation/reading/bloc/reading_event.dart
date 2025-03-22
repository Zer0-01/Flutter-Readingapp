part of 'reading_bloc.dart';

class ReadingEvent extends Equatable {
  const ReadingEvent();

  @override
  List<Object?> get props => [];
}

class OnPressedSeterusnyaEvent extends ReadingEvent {
  final String syllable;

  const OnPressedSeterusnyaEvent({required this.syllable});
  @override
  List<Object?> get props => [syllable];
}
