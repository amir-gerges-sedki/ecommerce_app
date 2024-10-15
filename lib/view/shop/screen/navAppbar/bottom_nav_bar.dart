import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';

import 'package:master_store/view/shop/controller/bottom_nav_bar_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavBarControllerImp());
    return GetBuilder<BottomNavBarControllerImp>(
        builder: (controller) => Scaffold(
              extendBody: true,
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(AppSizes.sm),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                  child: CurvedNavigationBar(
                    index: controller.currentpage,
                    color: AppColor.black,
                    buttonBackgroundColor: AppColor.primary,
                    backgroundColor: Colors.transparent,
                    onTap: (value) {
                      controller.changePage(value);
                    },
                    items: controller.iconButtom,
                  ),
                ),
              ),
              body: controller.listPage.elementAt(controller.currentpage),
            ));
  }
}
