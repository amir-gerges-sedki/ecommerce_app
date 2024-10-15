import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/validator.dart/validator.dart';
import 'package:master_store/view/auth/controller/auth/forgetpassword/forget_password_controller.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return SizedBox(
      width: double.infinity,
      child: Form(
        key: controller.forgetPasswordKey,
        child: TextFormField(
          controller: controller.email,
          validator: (val) => AppValidator.validatorEmail(val),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.email_outlined,
              color: AppColor.primary,
            ),
            labelText: AppStrings.email,
          ),
        ),
      ),
    );
  }
}
