import 'package:frifri/src/feature/more/domain/entities/airport_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template global_pref_helper}
/// GlobalPrefHelper.
/// {@endtemplate}
base class GlobalPrefHelper {
  /// {@macro global_pref_helper}
  GlobalPrefHelper({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  static const _airportKey = 'airport';
  static const _currencyKey = 'currency';
  static const _langCodeKey = 'langCode';
  static const _pushEnabledKey = 'pushEnabled';

  static const _airportDefault = 'tbilisi';
  static const _currencyDefault = 'USD';
  static const _langCodeDefault = 'ru';
  static const _pushEnabledDefault = true;

  AirportEnum getAirport() {
    final airportName =
        sharedPreferences.getString(_airportKey) ?? _airportDefault;
    final AirportEnum airport = getAirportFromString(airportName);
    return airport;
  }

  void setAirport(AirportEnum newValue) {
    final airportName = newValue.name;
    sharedPreferences.setString(_airportKey, airportName);
  }

  String getCurrency() {
    return sharedPreferences.getString(_currencyKey) ?? _currencyDefault;
  }

  void setCurrency(String newValue) {
    sharedPreferences.setString(_currencyKey, newValue);
  }

  String getLanguageCode() {
    return sharedPreferences.getString(_langCodeKey) ?? _langCodeDefault;
  }

  void setLanguageCode(String newValue) {
    sharedPreferences.setString(_langCodeKey, newValue);
  }

  bool getPushEnabled() {
    return sharedPreferences.getBool(_pushEnabledKey) ?? _pushEnabledDefault;
  }

  void setPushEnabled(bool newValue) {
    sharedPreferences.setBool(_pushEnabledKey, newValue);
  }
}
