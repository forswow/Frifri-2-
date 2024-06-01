import 'package:flutter/material.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/core/supabase/access/supabase_access.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/application/root_app/presentation/widgets/root_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// {@template runner}
/// Runner.
/// {@endtemplate}
abstract final class Runner {
  /// {@macro runner}

  static Future<void> startApplication() async {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (details){
      logger.e('Flutter error', error: details.exception, stackTrace: details.stack);
    };
    await Supabase.initialize(
      url: SupaBaseAccess.url,
      anonKey: SupaBaseAccess.anonKey,
    );
    final dependencies = Dependencies();
    await dependencies.initializationDependencies();

    runApp(
      RootApp(
        dependencies: dependencies,
      ),
    );
  }
}
