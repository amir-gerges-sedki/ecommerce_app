import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';
import 'package:master_store/common/widgets/text/section_title.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/validator.dart/validator.dart';
import 'package:master_store/view/personlization/controller/update_user_info_controller.dart';
import 'package:master_store/view/personlization/controller/user_controller.dart';
import 'package:master_store/view/personlization/screens/profile/updates/update_user_info_screen.dart';
import 'package:master_store/view/personlization/screens/profile/widgets/update_profile_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final updateController = Get.put(UpdateController());
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Profile'),
        showBachArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    GetBuilder(
                        init: controller,
                        builder: (controller) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: SizedBox(
                                  height: 50,
                                  child: controller.profilePicPath != null
                                      ? Image.file(
                                          File(controller.profilePicPath!))
                                      : Image.asset(
                                          ImageAssets.appLogo,
                                        )
                                  // : const ShimmerEffect(
                                  //     height: 100, width: 100)
                                  ));
                        }),
                    TextButton(
                        onPressed: () => controller.getImage(),
                        child: const Text('Change your profile picture'))
                  ],
                )),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: AppSizes.spaceBtwItems),
            const SectionTitle(
              title: 'Profile information',
              showButton: false,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            UpdateProfileInfo(
                title: 'Name',
                titleInfo: controller.user.value.userName,
                icon: Icons.arrow_forward_ios_outlined,
                onTap: () => Get.to(() => UpdateUserInfoScreen(
                      title: 'Change Name',
                      scription: 'Use real name for easy verification.',
                      controller: updateController.userName,
                      validator: (val) =>
                          AppValidator.validEmptyField('userName', val),
                      labelText: 'Name',
                      prefixIcon: const Icon(Icons.person_2_outlined),
                    ))),
            UpdateProfileInfo(
                title: 'Email',
                titleInfo: controller.user.value.email,
                icon: Icons.arrow_forward_ios_outlined,
                onTap: () => Get.to(() => UpdateUserInfoScreen(
                      title: 'Change Email',
                      scription: 'Use real Email for easy verification',
                      controller: updateController.email,
                      validator: (val) =>
                          AppValidator.validEmptyField('email', val),
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                    ))),
            UpdateProfileInfo(
                title: 'PhoneNo',
                titleInfo: controller.user.value.phone,
                icon: Icons.arrow_forward_ios_outlined,
                onTap: () => Get.to(() => UpdateUserInfoScreen(
                      title: 'Change Phone Number',
                      scription: 'Use real Phone Number for easy verification',
                      controller: updateController.phoneNumer,
                      validator: (val) => AppValidator.validatorPhone(val),
                      labelText: 'Phone Number',
                      prefixIcon: const Icon(Icons.phone),
                    ))),
            const SizedBox(height: AppSizes.spaceBtwSection),
          ],
        ),
      )),
    );
  }
}
