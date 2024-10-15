import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/device/device_utiles.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch(
      {super.key,
      required this.title,
      this.icon,
      this.showBackground = true,
      this.showBorder = true,
      this.padding =
          const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace)});
  final String title;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFun.isDarkMode(context);
    return Padding(
        padding: padding,
        child: Container(
          width: DeviceUtils.getScreenWidth(),
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? AppColor.dark
                    : AppColor.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: AppColor.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: dark ? AppColor.dark : AppColor.light,
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Text(title, style: AppTextTheme.darkTextTheme.bodySmall),
            ],
          ),
        ));
  }
}
