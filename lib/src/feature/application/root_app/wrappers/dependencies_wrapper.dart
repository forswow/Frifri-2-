import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template dependencies_wrapper}
/// DependenciesWrapper.
/// {@endtemplate}
final class DependenciesWrapper {
  /// {@macro dependencies_wrapper}

  static DependenciesScope of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<DependenciesScope>()!;
  late final SharedPreferences sharedPreferences;

  Future<void> initializationDependencies() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}

/// {@template dependencies_wrapper}
/// DependenciesScope widget.
/// {@endtemplate}
class DependenciesScope extends InheritedWidget {
  /// {@macro dependencies_wrapper}
  const DependenciesScope({
    required this.dependenciesWrapper,
    required super.child,
    super.key,
  });

  final DependenciesWrapper dependenciesWrapper;
  @override
  bool updateShouldNotify(DependenciesScope oldWidget) => false;
}
