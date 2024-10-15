import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/theme/app_theme.dart';
import 'package:master_store/core/device/device_utiles.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/auth/controller/auth/forgetpassword/forget_password_controller.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.darkGrey.withOpacity(0.8),
              ),
              margin: const EdgeInsets.all(AppSizes.sm),
              child: IconButton(
                  onPressed: () => Get.offAllNamed(AppRoute.login),
                  icon: const Icon(
                    Icons.clear,
                    color: AppColor.black,
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: SpaceingStyle.paddingwithAppBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(ImageAssets.appLogo),
                  width: DeviceUtils.getScreenWidth() * 0.4,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text(
                  AppStrings.resendPasswordTitle,
                  style: AppTextTheme.darkTextTheme.headlineMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text(email,
                    style: AppTextTheme.darkTextTheme.labelLarge,
                    textAlign: TextAlign.start),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                Text(AppStrings.resendPasswordDescription,
                    style: AppTextTheme.darkTextTheme.labelMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: AppSizes.spaceBtwSection),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: AppTheme.darkMode.elevatedButtonTheme.style,
                    onPressed: () => Get.offAllNamed(AppRoute.login),
                    child: const Text(AppStrings.done),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwSection),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => controller.resendPasswordResetEmail(email),
                    child: const Text(
                      AppStrings.resendEmail,
                      style: TextStyle(color: AppColor.darkGrey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
