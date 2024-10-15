import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/theme/app_theme.dart';
import 'package:master_store/view/auth/controller/auth/forgetpassword/forget_password_controller.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: AppTheme.darkMode.elevatedButtonTheme.style,
        onPressed: () => controller.sendPasswordResetEmail(),
        child: const Text(AppStrings.submit),
      ),
    );
  }
}
