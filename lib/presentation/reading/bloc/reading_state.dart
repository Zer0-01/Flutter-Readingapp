part of 'reading_bloc.dart';

class ReadingState extends Equatable {
  final List<String> syllables;
  final String word;

  const ReadingState({this.syllables = const [], this.word = ''});

  ReadingState copyWith({
    List<String>? syllables,
    String? word,
  }) {
    return ReadingState(
      syllables: syllables ?? this.syllables,
      word: word ?? this.word,
    );
  }

  @override
  List<Object?> get props => [syllables, word];
}
