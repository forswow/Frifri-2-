import 'package:flutter/material.dart';

/// {@template confirm_button_widget}
/// ConfirmButtonWidget widget.
/// {@endtemplate}
class ConfirmButtonWidget extends StatelessWidget {
  /// {@macro confirm_button_widget}
  const ConfirmButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: const Text(''));
  }
}
