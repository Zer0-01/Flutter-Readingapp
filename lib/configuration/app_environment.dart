enum Environment { dev, stag, prod }

class ProfileConstants {
  static Map<String, dynamic>? _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        _config = _Config.devConstants;
        break;
      case Environment.stag:
        _config = _Config.stagConstants;
        break;
      case Environment.prod:
        _config = _Config.prodConstants;
        break;
    }
  }

  static bool get isProduction {
    return _config == _Config.prodConstants;
  }

  static bool get isDevelopment {
    return _config == _Config.devConstants;
  }

  static bool get isStaging {
    return _config == _Config.stagConstants;
  }

  static get api {
    return _config![_Config.api];
  }
}

class _Config {
  static const api = "API";

  static Map<String, dynamic> devConstants = {
    api: "mock",
  };

  static Map<String, dynamic> stagConstants = {
    api: "mock",
  };

  static Map<String, dynamic> prodConstants = {
    api: "https://dhw-api.onrender.com/api",
  };
}
