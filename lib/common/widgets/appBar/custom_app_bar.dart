import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/device/device_utiles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showBachArrow = false,
    this.action,
    this.leadingIcon,
    this.leadingOnPressed,
  });
  final Widget? title;
  final bool showBachArrow;
  final List<Widget>? action;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
          automaticallyImplyLeading: false,
          title: title,
          actions: action,
          leading: showBachArrow
              ? IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back))
              : leadingIcon != null
                  ? IconButton(
                      onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                  : null),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(DeviceUtils.getStatusBarHeight() + 40);
}
