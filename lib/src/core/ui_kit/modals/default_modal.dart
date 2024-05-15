import 'package:flutter/material.dart';

const double _topBorderRadius = 20.0;

/// Стандартный класс-обёртка для модалок
/// в него можно передать содержимое модального окна Stateful/less
class DefaultModalWrapper extends StatelessWidget {
  const DefaultModalWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.9,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              _topBorderRadius,
            ),
            topRight: Radius.circular(
              _topBorderRadius,
            ),
          ),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
