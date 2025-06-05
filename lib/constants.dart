// ignore_for_file: constant_identifier_names

class ImageConstants {
  ImageConstants._();

  static const String BACKGROUND_IMAGE = 'assets/images/dood-background.png';
  static const String IMAGE_BANNER = 'assets/images/image_banner.png';
  static const String IMAGE_READING = 'assets/images/image_reading.png';
  static const String IMAGE_PHONIC = 'assets/images/image_phonic.png';
  static const String IMAGE_COMING_SOON = 'assets/images/image_coming_soon.png';
}

class VectorConstants {
  VectorConstants._();
  static const String VECTOR_SUCCESS_FILLED =
      'assets/vectors/vector_success_filled.svg';
}

class AudioConstants {
  AudioConstants._();
  static const String AUDIO_A = 'audios/audio_a.mp3';
  static const String AUDIO_B = 'audios/audio_b.mp3';
  static const String AUDIO_C = 'audios/audio_c.mp3';
  static const String AUDIO_D = 'audios/audio_d.mp3';
  static const String AUDIO_E = 'audios/audio_e.mp3';
  static const String AUDIO_E_2 = 'audios/audio_e_2.mp3';
  static const String AUDIO_F = 'audios/audio_f.mp3';
  static const String AUDIO_G = 'audios/audio_g.mp3';
  static const String AUDIO_H = 'audios/audio_h.mp3';
  static const String AUDIO_I = 'audios/audio_i.mp3';
  static const String AUDIO_J = 'audios/audio_j.mp3';
  static const String AUDIO_K = 'audios/audio_k.mp3';
  static const String AUDIO_L = 'audios/audio_l.mp3';
  static const String AUDIO_M = 'audios/audio_m.mp3';
  static const String AUDIO_N = 'audios/audio_n.mp3';
  static const String AUDIO_O = 'audios/audio_o.mp3';
  static const String AUDIO_P = 'audios/audio_p.mp3';
  static const String AUDIO_Q = 'audios/audio_q.mp3';
  static const String AUDIO_R = 'audios/audio_r.mp3';
  static const String AUDIO_S = 'audios/audio_s.mp3';
  static const String AUDIO_T = 'audios/audio_t.mp3';
  static const String AUDIO_U = 'audios/audio_u.mp3';
  static const String AUDIO_V = 'audios/audio_v.mp3';
  static const String AUDIO_W = 'audios/audio_w.mp3';
  static const String AUDIO_X = 'audios/audio_x.mp3';
  static const String AUDIO_Y = 'audios/audio_y.mp3';
  static const String AUDIO_Z = 'audios/audio_z.mp3';
}

class AnimationConstants {
  AnimationConstants._();
  static const String ANIMATION_LOADING =
      'assets/animations/animation_loading.json';
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
