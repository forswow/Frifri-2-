import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frifri/src/feature/application/initialization/runner/runner.dart';

void main() {
  runZonedGuarded(
    () async {
      await Runner.startApplication();
    },
    (error, stack) {
      debugPrintStack(
        stackTrace: stack,
        label: error.toString(),
      );
    },
  );
}
