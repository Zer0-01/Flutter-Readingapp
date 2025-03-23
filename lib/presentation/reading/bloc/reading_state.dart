part of 'reading_bloc.dart';

class ReadingState extends Equatable {
  final List<String> syllables;
  final String word;
  final CountryEnum country;

  const ReadingState(
      {this.syllables = const [], this.word = '', required this.country});

  ReadingState copyWith({
    List<String>? syllables,
    String? word,
    CountryEnum? country,
  }) {
    return ReadingState(
      syllables: syllables ?? this.syllables,
      word: word ?? this.word,
      country: country ?? this.country,
    );
  }

  @override
  List<Object?> get props => [syllables, word, country];
}
