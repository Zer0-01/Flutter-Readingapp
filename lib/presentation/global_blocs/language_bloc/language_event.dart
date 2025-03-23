part of 'language_bloc.dart';

class LanguageEvent extends Equatable {
  const LanguageEvent();
  @override
  List<Object?> get props => [];
}

class OnChangedLanguageEvent extends LanguageEvent {
  final CountryEnum language;
  const OnChangedLanguageEvent({required this.language});
  @override
  List<Object?> get props => [language];
}
