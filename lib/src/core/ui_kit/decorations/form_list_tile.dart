import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormListTile extends StatelessWidget {
  final SvgPicture icon;
  final Widget child;

  const FormListTile({
    required this.icon,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      tileColor: Colors.white,
      leading: icon,
      title: child,
    );
  }
}
