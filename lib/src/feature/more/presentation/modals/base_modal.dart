import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Это основа модального окна (BottomSheet)
/// Чтобы сделать модалку на её основе надо
/// 1. Унаследоваться от [BottomSheetModalBase]
/// 2. Переопределить [build_content] и [build_header]
class BottomSheetModalBase extends StatelessWidget {
  // Возможно в будущем сюда стоит добавить параметры
  // по умолчанию для возможности переопределения
  // свойств и внешнего вида модалки
  const BottomSheetModalBase({super.key});

  static const double _topBorderRadius = 20.0;
  static const Divider _defaultDivider = Divider(
    height: 0,
    thickness: 0.5,
  );

  Widget build_header(BuildContext context) {
    return Placeholder();
  }

  Widget build_content(BuildContext context) {
    return Placeholder();
  }

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
        ),
        child: Column(
          children: [
            build_header(context),
            _defaultDivider,
            build_content(context),
            // Container(
            //   height: MediaQuery.sizeOf(context).height * 0.815,
            //   child: SingleChildScrollView(child: build_content(context)),
            // ),
          ],
        ),
      ),
    );
  }
}

class DefaultModalHeader extends StatelessWidget {
  const DefaultModalHeader({required this.centerText, super.key});

  final String centerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Icon(
                Icons.close,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              centerText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
