import 'package:flutter/material.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/core/supabase/access/supabase_access.dart';
import 'package:frifri/src/feature/application/root_app/presentation/widgets/root_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// {@template runner}
/// Runner.
/// {@endtemplate}
abstract final class Runner {
  /// {@macro runner}

  static Future<void> startApplication() async {
    WidgetsFlutterBinding.ensureInitialized();

    final dependencies = Dependencies();
    await dependencies.initializationDependencies();
    await Supabase.initialize(
      url: SupaBaseAccess.url,
      anonKey: SupaBaseAccess.anonKey,
    );
    runApp(
      RootApp(
        dependencies: dependencies,
      ),
    );
  }
}
