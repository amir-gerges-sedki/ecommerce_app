import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/personlization/controller/user_controller.dart';
import 'package:master_store/view/personlization/screens/profile/profile_screen.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        builder: (controller) => ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: SizedBox(
                    height: 50,
                    child: controller.profilePicPath != null
                        ? Image.file(File(controller.profilePicPath!))
                        : const ShimmerEffect(height: 100, width: 100),
                  )),
              title: Text(controller.user.value.userName,
                  style: AppTextTheme.darkTextTheme.headlineSmall),
              subtitle: Text(controller.user.value.email,
                  style: AppTextTheme.darkTextTheme.labelMedium),
              trailing: IconButton(
                  onPressed: () => Get.to(() => const ProfileScreen()),
                  icon: const Icon(Icons.edit_note_outlined),
                  color: AppColor.white),
            ));
  }
}
