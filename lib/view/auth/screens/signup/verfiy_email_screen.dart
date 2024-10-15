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
import 'package:master_store/view/auth/controller/auth/signup/verify_email_controller.dart';

class VerfiyEmailScreen extends StatelessWidget {
  const VerfiyEmailScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final verfiyController = Get.put(VerifyEmail());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.darkGrey.withOpacity(0.8)),
            margin: const EdgeInsets.all(AppSizes.sm),
            child: IconButton(
                onPressed: () => Get.offAllNamed(AppRoute.login),
                icon: const Icon(Icons.clear, color: AppColor.black)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                Image(
                    image: const AssetImage(ImageAssets.appLogo),
                    width: DeviceUtils.getScreenWidth() * 0.4),
                const SizedBox(height: AppSizes.spaceBtwSection),
                Text(AppStrings.confirmEmail,
                    style: AppTextTheme.darkTextTheme.headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text(email ?? '',
                    style: AppTextTheme.darkTextTheme.labelLarge,
                    textAlign: TextAlign.center),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text(AppStrings.confirmEmailDescription,
                    style: AppTextTheme.darkTextTheme.labelMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: AppSizes.spaceBtwSection),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: AppTheme.darkMode.elevatedButtonTheme.style,
                      onPressed: () => verfiyController.checkEmailVerified(),
                      child: const Text(AppStrings.tContinue)),
                ),
                const SizedBox(height: AppSizes.spaceBtwSection),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: AppTheme.darkMode.textButtonTheme.style,
                    onPressed: () => verfiyController.sendEmailVerification(),
                    child: const Text(
                      AppStrings.resendEmail,
                      style: TextStyle(color: AppColor.darkGrey),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
