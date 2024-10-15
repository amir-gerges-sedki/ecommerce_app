import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.trailing,
      this.onTap});
  final IconData icon;
  final String title;
  final String subTitle;
  final Widget? trailing;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: AppColor.primary,
      ),
      title: Text(
        title,
        style: AppTextTheme.darkTextTheme.titleMedium,
      ),
      subtitle: Text(
        subTitle,
        style: AppTextTheme.darkTextTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
