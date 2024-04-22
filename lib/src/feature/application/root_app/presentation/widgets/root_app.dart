import 'package:flutter/material.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/feature/application/root_app/presentation/widgets/app.dart';

/// {@template root_app}
/// RootApp widget.
/// {@endtemplate}
class RootApp extends StatelessWidget {
  /// {@macro root_app}
  const RootApp({
    super.key,
    required this.dependencies,
  });

  final Dependencies dependencies;
  @override
  Widget build(BuildContext context) {
    return DependenciesScope(
      d: dependencies,
      child: Builder(
        builder: (context) {
          return App();
        }
      ),
    );
  }
}
