import 'package:flutter/material.dart';

mixin BaseModal {
  static const double _topBorderRadius = 20.0;
  static const Divider _defaultDivider = Divider(
    height: 0,
    thickness: 0.5,
  );

  Widget build_header(BuildContext context) {
    return Placeholder();
  }

  /// Основная функция, которая возвращает виджеты
  /// для отображения в модальном окне под заголовком
  Widget build_content(BuildContext context) {
    return Placeholder();
  }

  Widget build_modal(BuildContext context) {
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            build_header(context),
            _defaultDivider,
            build_content(context),
          ],
        ),
      ),
    );
  }
}

/// Это основа модального окна (BottomSheet)
/// Чтобы сделать модалку на её основе надо
/// 1. Унаследоваться от [BottomSheetStatelessModalBase]
/// 2. Переопределить [build_content] и [build_header]
class BottomSheetStatelessModalBase extends StatelessWidget with BaseModal {
  // Возможно в будущем сюда стоит добавить параметры
  // по умолчанию для возможности переопределения
  // свойств и внешнего вида модалки
  const BottomSheetStatelessModalBase({super.key});

  @override
  Widget build(BuildContext context) {
    return super.build_modal(context);
  }
}

class BottomSheetStatefulModalBase extends StatefulWidget {
  @override
  State<BottomSheetStatefulModalBase> createState() {
    return BottomSheetStatefulModalBaseState();
  }
}

class BottomSheetStatefulModalBaseState
    extends State<BottomSheetStatefulModalBase> with BaseModal {
  @override
  Widget build(BuildContext context) {
    return super.build_modal(context);
  }
}
