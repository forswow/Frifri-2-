import 'dart:async';

import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/application/i'
    'nitialization/runner/runner.dart';
void main() {
  runZonedGuarded(
    () async {
      await Runner.startApplication();
    },
    (error, stack) {
      logger.e('Zoned', error: error, stackTrace: stack);
    },
  );
}
