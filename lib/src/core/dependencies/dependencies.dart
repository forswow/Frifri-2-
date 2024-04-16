import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template dependencies}
/// Dependencies.
/// {@endtemplate}
base class Dependencies {
  /// {@macro dependencies}

  Dependencies of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<DependenciesScope>()!.d;

  late SharedPreferences sharedPreferences;

  Future<void> initializationDependencies() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}

/// {@template dependencies}
/// DependenciesScope widget.
/// {@endtemplate}
class DependenciesScope extends InheritedWidget {
  /// {@macro dependencies}
  const DependenciesScope({
    required this.d,
    required super.child,
    super.key,
  });

  final Dependencies d;

  @override
  bool updateShouldNotify(DependenciesScope oldWidget) => false;
}
