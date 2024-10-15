import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/theme/app_theme.dart';
import 'package:master_store/core/validator.dart/validator.dart';
import 'package:master_store/view/auth/controller/auth/login/login_controler.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    // required this.controller,
  });

  // final LoginControllerImp controller;

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Column(
      children: [
        Form(
          key: loginController.loginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                validator: (val) => AppValidator.validatorEmail(val),
                controller: loginController.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                  labelText: AppStrings.email,
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Obx(
                () => TextFormField(
                  controller: loginController.password,
                  validator: (val) => AppValidator.validatorPassword(val),
                  obscureText: loginController.isshowpassword.value,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password_rounded),
                      labelText: AppStrings.password,
                      suffixIcon: IconButton(
                        onPressed: () => loginController.isshowpassword.value =
                            !loginController.isshowpassword.value,
                        icon: loginController.isshowpassword.value
                            ? const Icon(Icons.lock_outline)
                            : const Icon(Icons.lock_open_sharp),
                      )),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Obx(
                  () => Checkbox(
                      value: loginController.rememberMe.value,
                      onChanged: (value) => loginController.rememberMe.value =
                          !loginController.rememberMe.value),
                ),
                const Text(AppStrings.rememberMe)
              ],
            ),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoute.forgetPassword);
              },
              child: const Text(AppStrings.forgotPassword),
            )
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Padding(
          padding: const EdgeInsets.all(AppSizes.sm),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: AppTheme.darkMode.elevatedButtonTheme.style,
              onPressed: () {
                loginController.signWithEmailAndPassword();
              },
              child: const Text(AppStrings.login),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.md),

        //logging with GOOGLE

        Padding(
          padding: const EdgeInsets.all(AppSizes.sm),
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                AppColor.dark,
              )),
              onPressed: () => loginController.signWithGoogle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageAssets.googleLogo,
                    width: 30,
                  ),
                  const SizedBox(
                    width: AppSizes.md,
                  ),
                  const Text(AppStrings.loginWithGoogle),
                ],
              ),
            ),
          ),
        ),

        //logging with FACEBOOK
        Padding(
          padding: const EdgeInsets.all(AppSizes.sm),
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                AppColor.dark,
              )),
              onPressed: () {
                // controller.goToSignUp();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: AppSizes.md),
                  Image.asset(
                    ImageAssets.facebookLogo,
                    width: 35,
                  ),
                  const SizedBox(width: AppSizes.md),
                  const Text(AppStrings.loginWithFacebook),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwSection),
      ],
    );
  }
}
