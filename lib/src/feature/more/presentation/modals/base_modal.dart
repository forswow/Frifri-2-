import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  /// Возвращает список [Widget] для отображения на модальном окне
  /// каждый [Widget] в списке может быть обёрнут в In-Stack виджеты
  /// например: [Align], [Positioned]
  List<Widget> build_overlay(BuildContext context) {
    return [];
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
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                build_header(context),
                _defaultDivider,
                Expanded(
                  child: SingleChildScrollView(
                    child: build_content(context),
                  ),
                ),
              ],
            ),
            ...build_overlay(context)
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
              child: SvgPicture.asset(
                "assets/icons/close.svg",
                height: 21,
                alignment: Alignment.centerRight,
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
