import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// {@template url_launcher_helper}
/// UrlLauncherHelper.
/// {@endtemplate}
base class UrlLauncherHelper {
  /// {@macro url_launcher_helper}

  static Future<void> launchInWeb(String url) async {
    try {
      if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
        throw Exception('data'); // O.o
      }
    } on Exception catch (err, stack) {
      debugPrintStack(stackTrace: stack, label: err.toString());
    }
  }
}
