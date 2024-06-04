import 'package:frifri/src/feature/more/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/more/domain/entities/currency_entity.dart';
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

  CurrencyEnum getCurrency() {
    final currencyName =
        sharedPreferences.getString(_currencyKey) ?? _currencyDefault;
    final currencyEnum = currencyFromString(currencyName);
    return currencyEnum;
  }

  void setCurrency(CurrencyEnum newValue) {
    final String currencyName = newValue.name;
    sharedPreferences.setString(_currencyKey, currencyName);
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
