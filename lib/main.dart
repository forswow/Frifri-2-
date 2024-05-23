import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/application/initialization/runner/runner.dart';

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
