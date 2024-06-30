import 'package:flutter/material.dart';
import 'package:frifri/src/core/theme/colors.dart';

class RoundedListContainer extends StatelessWidget {
  const RoundedListContainer({
    required this.children,
    this.separator = defaultListDivider,
    super.key,
  });

  final List<Widget> children;
  final Widget separator;

  static const defaultListDivider = Divider(
    height: 1,
    thickness: 0.5,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: kBorderPrimaryColor,
        ),
      ),
      margin: const EdgeInsets.all(24),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: children.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => children[index],
        separatorBuilder: (context, index) => separator,
      ),
    );
  }
}
