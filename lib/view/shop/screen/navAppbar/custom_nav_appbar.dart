import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final bool active;
  const CustomAppBar({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.active,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: active == true ? AppColor.primary : AppColor.dark,
        size: 30,
      ),
    );
  }
}
