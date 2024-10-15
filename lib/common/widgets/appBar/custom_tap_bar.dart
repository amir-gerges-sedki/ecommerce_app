import 'package:flutter/material.dart';

import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/device/device_utiles.dart';
import 'package:master_store/core/helper/helper.dart';

class CustomTapAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTapAppBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: HelperFun.isDarkMode(context) ? AppColor.black : AppColor.white,
      child: TabBar(
        tabs: tabs.map((tab) {
          return tab;
        }).toList(),
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: AppColor.primary,
        labelColor:
            HelperFun.isDarkMode(context) ? AppColor.white : AppColor.primary,
        unselectedLabelColor: AppColor.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
