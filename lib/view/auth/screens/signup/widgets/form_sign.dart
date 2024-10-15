import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/theme/app_theme.dart';
import 'package:master_store/core/validator.dart/validator.dart';
import 'package:master_store/view/auth/controller/auth/login/login_controler.dart';
import 'package:master_store/view/auth/controller/auth/signup/signup_controler.dart';

class FormSignup extends StatelessWidget {
  const FormSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put((SignUpController()));
    final loginController = Get.put((LoginController()));

    return Form(
      key: controller.signupKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.userName,
            validator: (val) => AppValidator.validEmptyField('userName', val),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_2_outlined),
              labelText: AppStrings.username,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          TextFormField(
            controller: controller.phone,
            validator: (val) => AppValidator.validatorPhone(val),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: AppStrings.phoneNumber,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          TextFormField(
            controller: controller.email,
            validator: (val) => AppValidator.validatorEmail(val),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: AppStrings.email,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (val) => AppValidator.validatorPassword(val),
              obscureText: controller.isshowpassword.value,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password_rounded),
                  labelText: AppStrings.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.isshowpassword.value =
                        !controller.isshowpassword.value,
                    icon: controller.isshowpassword.value
                        ? const Icon(Icons.lock_outline)
                        : const Icon(Icons.lock_open_sharp),
                  )),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),

          Row(
            children: [
              Obx(
                () => Checkbox(
                    value: controller.privacyPolicy.value,
                    onChanged: (value) => controller.privacyPolicy.value =
                        !controller.privacyPolicy.value),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: AppStrings.agree,
                    style: AppTheme.darkMode.textTheme.bodySmall),
                TextSpan(
                    text: AppStrings.privacyPolicy,
                    style: AppTheme.darkMode.textTheme.bodyMedium!.apply(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.white)),
                TextSpan(
                    text: AppStrings.and,
                    style: AppTheme.darkMode.textTheme.bodySmall),
                TextSpan(
                    text: AppStrings.itemsUse,
                    style: AppTheme.darkMode.textTheme.bodyMedium!.apply(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.white)),
              ])),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: AppTheme.darkMode.elevatedButtonTheme.style,
                onPressed: () => controller.signup(),
                child: const Text(AppStrings.signup),
              ),
            ),
          ),

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
                onPressed: () {
                  loginController.signWithGoogle();
                },
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
          // CustomFromFeild(
          //   title: 'Name',
          //   hint: 'Enter Your full name',
          //   controller: controller.username,
          //   icon: Icons.person_2_outlined,
          //   valid: (val) {
          //     return Format.validInput(val!, "username", 3, 30);
          //   },
          //   isnumber: false,
          // ),
          // CustomFromFeild(
          //   title: 'Phone',
          //   hint: 'Enter Your number phone',
          //   controller: controller.phone,
          //   icon: Icons.phone,
          //   valid: (val) {
          //     return Format.validInput(val!, "phone", 11, 14);
          //   },
          //   isnumber: true,
          // ),
          // CustomFromFeild(
          //   title: 'Email',
          //   hint: 'Enter You Email',
          //   controller: controller.email,
          //   icon: Icons.email_outlined,
          //   valid: (val) {
          //     return Format.validInput(val!, "email", 10, 40);
          //   },
          //   isnumber: false,
          // ),
          // GetBuilder<SignUpControllerImp>(builder: (context) {
          //   return CustomFromFeild(
          //     title: 'Password',
          //     hint: 'Enter You Password',
          //     controller: controller.password,
          //     obscureText: controller.isshowpassword,
          //     onTapIcon: () {
          //       controller.showPassword();
          //     },
          //     icon: controller.icontype == true
          //         ? Icons.lock_open_sharp
          //         : Icons.lock_outline,
          //     valid: (val) {
          //       return Format.validInput(val!, "password", 8, 20);
          //     },
          //     isnumber: false,
          //   );
          // }),
        ],
      ),
    );
  }
}
