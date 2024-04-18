import 'package:flutter/material.dart';

/// Это основа модального окна (BottomSheet)
/// Чтобы сделать модалку на её основе надо
/// 1. Унаследоваться от [BottomSheetModalBase]
/// 2. Переопределить [_build_content] и [_build_header]
class BottomSheetModalBase extends StatelessWidget {
  const BottomSheetModalBase({super.key});

  static const double _topBorderRadius = 20.0;
  static const Divider _defaultDivider = Divider(
    height: 1,
    thickness: 0.5,
  );

  Widget _build_header(BuildContext context) {
    return Placeholder();
  }

  Widget _build_content(BuildContext context) {
    return Placeholder();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.9,
      width: MediaQuery.sizeOf(context).width,
      child: Container(
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
            _build_header(context),
            _defaultDivider,
            _build_content(context),
          ],
        ),
      ),
    );
  }
}