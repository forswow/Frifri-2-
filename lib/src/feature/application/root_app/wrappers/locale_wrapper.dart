import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template locale_wrapper}
/// LocaleWrapper widget.
/// {@endtemplate}
class LocaleWrapper extends StatefulWidget {
  /// {@macro locale_wrapper}
  const LocaleWrapper(
      {super.key,
      required this.locale,
      required this.child,
      required this.sharedPreferences});

  final Locale locale;
  final Widget child;
  final SharedPreferences sharedPreferences;

  static LocaleWrapperState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<LocaleWrapperState>();

  @override
  State<LocaleWrapper> createState() => LocaleWrapperState();
}

class LocaleWrapperState extends State<LocaleWrapper> {
  late Locale locale;

  String get currentLocale => locale.languageCode;
  @override
  void initState() {
    locale = widget.locale;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LocaleScope(locale: locale, child: widget.child);
  }

  Future<void> changeLangauge(final String langCode) async {
    switch (langCode) {
      case 'ka':
        await _saveLocale(langCode).then((value) => updateLocale(langCode));
      case 'en':
        await _saveLocale(langCode).then((value) => updateLocale(langCode));
      case 'ru':
        await _saveLocale(langCode).then((value) => updateLocale(langCode));
    }
  }

  void updateLocale(final String langCode) {
    setState(() {
      locale = Locale(langCode);
    });
  }

  Future<void> _saveLocale(String langCode) async {
    try {
      await widget.sharedPreferences.setString('langCode', langCode);
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }
}

/// {@template locale_wrapper}
/// LocaleScope widget.
/// {@endtemplate}
class LocaleScope extends InheritedWidget {
  /// {@macro locale_wrapper}
  const LocaleScope({
    required this.locale,
    required super.child,
    super.key,
  });

  final Locale locale;

  static LocaleScope of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LocaleScope>()!;
  }

  @override
  bool updateShouldNotify(LocaleScope oldWidget) => locale != oldWidget.locale;
}
