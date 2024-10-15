import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/auth/screens/signup/widgets/form_sign.dart';
import 'package:master_store/view/auth/screens/signup/widgets/text_span_signup.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    // SignUpControllerImp controller = Get.put(SignUpControllerImp());

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  AppStrings.createyourAccount,
                  style: AppTextTheme.darkTextTheme.headlineMedium,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                const FormSignup(),
                const SizedBox(height: AppSizes.spaceBtwItems),
                const TextSpanButton()
              ],
            ),
          ),
        ));
  }
}
