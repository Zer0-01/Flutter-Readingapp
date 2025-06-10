// Storage wrapper for shared preferences and get storage in Application (with strategy pattern)
// This file contains the implementation of the local storage for the application.
// It uses shared preferences and get storage to store data locally.
// It also contains the implementation of the cache for the application.

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageStrategy {
  Future<bool> save(String key, dynamic value);

  Future<dynamic> read(String key);

  Future<bool> remove(String key);

  Future<void> clear();
}

class AppLocalStorageCached {
  static late String? jwtToken;
  static late List<String>? roles;
  static late String? language;
  static late String? username;
  static late String? theme;

  static Future<void> loadCache() async {
    jwtToken = await AppLocalStorage().read(StorageKeys.jwtToken.name);
    roles = await AppLocalStorage().read(StorageKeys.roles.name);
    language = await AppLocalStorage().read(StorageKeys.language.name) ?? "en";
    username = await AppLocalStorage().read(StorageKeys.username.name);
    theme = await AppLocalStorage().read(StorageKeys.theme.name) ??
        AdaptiveThemeMode.light.name;
  }
}

enum StorageKeys { jwtToken, roles, language, username, theme, textToSpeech }

class SharedPreferencesStrategy implements StorageStrategy {
  static final SharedPreferencesStrategy _instance =
      SharedPreferencesStrategy._internal();

  SharedPreferencesStrategy._internal();

  factory SharedPreferencesStrategy() {
    return _instance;
  }

  SharedPreferences? _prefsInstance;

  @visibleForTesting
  void setPreferencesInstance(SharedPreferences prefs) {
    _prefsInstance = prefs;
  }

  Future<SharedPreferences> get _prefs async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  @override
  Future<bool> save(String key, dynamic value) async {
    final prefs = await _prefs;
    try {
      if (value is String) {
        prefs.setString(key, value);
      } else if (value is int) {
        prefs.setInt(key, value);
      } else if (value is double) {
        prefs.setDouble(key, value);
      } else if (value is bool) {
        prefs.setBool(key, value);
      } else if (value is List<String>) {
        prefs.setStringList(key, value);
      } else {
        throw Exception("Unsupported value type");
      }

      await AppLocalStorageCached.loadCache();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<dynamic> read(String key) async {
    final prefs = await _prefs;
    final result = prefs.get(key);
    return result;
  }

  @override
  Future<bool> remove(String key) async {
    try {
      final prefs = await _prefs;
      prefs.remove(key);
      await AppLocalStorageCached.loadCache();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> clear() async {
    final prefs = await _prefs;
    prefs.clear();
    await AppLocalStorageCached.loadCache();
  }
}

enum StorageType { sharedPreferences }

class AppLocalStorage {
  static final AppLocalStorage _instance = AppLocalStorage._internal();

  late StorageStrategy _strategy;

  AppLocalStorage._internal() {
    _strategy = SharedPreferencesStrategy();
  }

  factory AppLocalStorage() => _instance;

  void setStorage(StorageType type) {
    switch (type) {
      case StorageType.sharedPreferences:
        _strategy = SharedPreferencesStrategy();
        break;
    }
  }

  Future<bool> save(String key, dynamic value) async {
    final result = await _strategy.save(key, value);
    await AppLocalStorageCached.loadCache();
    return result;
  }

  Future<dynamic> read(String key) async {
    return await _strategy.read(key);
  }

  Future<bool> remove(String key) async {
    final result = await _strategy.remove(key);
    await AppLocalStorageCached.loadCache();
    return result;
  }

  Future<void> clear() async {
    await _strategy.clear();
    await AppLocalStorageCached.loadCache();
  }
}
