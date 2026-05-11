import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/theme_provider.dart';

const _localeKey = 'locale_code';

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return LocaleNotifier(prefs);
});

class LocaleNotifier extends StateNotifier<Locale> {
  final SharedPreferences _prefs;

  LocaleNotifier(this._prefs) : super(_loadLocale(_prefs));

  static Locale _loadLocale(SharedPreferences prefs) {
    final code = prefs.getString(_localeKey);
    if (code == 'id') return const Locale('id');
    return const Locale('en');
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await _prefs.setString(_localeKey, locale.languageCode);
  }
}
