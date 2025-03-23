// ignore_for_file: constant_identifier_names

class ImageConstants {
  ImageConstants._();

  static const String BACKGROUND_IMAGE = 'assets/images/dood-background.png';
}

class CountryConstants {
  CountryConstants._();
  static const String MALAYSIA = 'Malaysia';
  static const String ENGLISH_UK = 'English-UK';
  static const String INDONESIA = 'Indonesia';
}

class LanguageCodeConstants {
  LanguageCodeConstants._();
  static const String MALAY = 'ms';
  static const String ENGLISH_UK = 'en';
  static const String INDONESIA = 'id';
}

class TextToSpeechConstants {
  TextToSpeechConstants._();
  static const String MALAY = 'ms-MY';
  static const String ENGLISH_UK = 'en-GB';
  static const String INDONESIA = 'id-ID';
}

enum CountryEnum {
  malaysia(CountryConstants.MALAYSIA, LanguageCodeConstants.MALAY,
      TextToSpeechConstants.MALAY),
  english_uk(CountryConstants.ENGLISH_UK, LanguageCodeConstants.ENGLISH_UK,
      TextToSpeechConstants.ENGLISH_UK),
  indonesia(CountryConstants.INDONESIA, LanguageCodeConstants.INDONESIA,
      TextToSpeechConstants.INDONESIA);

  final String country;
  final String languageCode;
  final String textToSpeech;

  const CountryEnum(this.country, this.languageCode, this.textToSpeech);
}
