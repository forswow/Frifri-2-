import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template additional_wrapper}
/// AdditionalWrapper widget.
/// {@endtemplate}
class AdditionalWrapper extends StatefulWidget {
  /// {@macro additional_wrapper}
  const AdditionalWrapper(
      {super.key,
      required this.sharedPreferences,
      required this.airport,
      required this.currency,
      required this.child});

  final String currency;
  final String airport;
  final SharedPreferences sharedPreferences;
  final Widget child;

  static AdditionalWrapperState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<AdditionalWrapperState>();
  @override
  State<AdditionalWrapper> createState() => AdditionalWrapperState();
}

class AdditionalWrapperState extends State<AdditionalWrapper> {
  @override
  Widget build(BuildContext context) {
    return AdditionalScope(
        airport: widget.airport,
        currency: widget.currency,
        child: widget.child);
  }
}

/// {@template additional_wrapper}
/// AdditionalScope widget.
/// {@endtemplate}
class AdditionalScope extends InheritedWidget {
  /// {@macro additional_wrapper}
  const AdditionalScope({
    required this.airport,
    required this.currency,
    required super.child,
    super.key,
  });

  final String airport;
  final String currency;

   static AdditionalScope of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AdditionalScope>()!;
  }
  @override
  bool updateShouldNotify(AdditionalScope oldWidget) =>
      airport != oldWidget.airport || currency != oldWidget.currency;
}
