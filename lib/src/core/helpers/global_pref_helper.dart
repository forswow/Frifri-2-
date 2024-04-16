import 'package:shared_preferences/shared_preferences.dart';

/// {@template global_pref_helper}
/// GlobalPrefHelper.
/// {@endtemplate}
base class GlobalPrefHelper {
  /// {@macro global_pref_helper}
  GlobalPrefHelper({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  String airPort() {
    return sharedPreferences.getString('airPort') ?? 'Тбилиси';
  }

  String currency() {
    return sharedPreferences.getString('currency') ?? '₽';
  }

  String language() {
    return sharedPreferences.getString('langCode') ??
        'ru';
  }
}
