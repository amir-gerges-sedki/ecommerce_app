import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/personlization/controller/update_user_info_controller.dart';

class UpdateUserInfoScreen extends StatelessWidget {
  const UpdateUserInfoScreen(
      {super.key,
      required this.title,
      required this.scription,
      required this.controller,
      required this.validator,
      required this.labelText,
      required this.prefixIcon});
  final String title;
  final String scription;
  final String labelText;
  final Widget prefixIcon;
  final TextEditingController controller;

  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    final updateController = Get.put(UpdateController());
    return Scaffold(
      appBar: CustomAppBar(
          showBachArrow: true,
          title: Text(
            title,
            style: AppTextTheme.darkTextTheme.headlineSmall,
          )),
      body: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              scription,
              style: AppTextTheme.darkTextTheme.labelMedium,
            ),
            const SizedBox(height: AppSizes.spaceBtwSection),

            // Form
            Form(
                key: updateController.updateUserInfoKey,
                child: TextFormField(
                  controller: controller,
                  validator: validator,
                  decoration: InputDecoration(
                      labelText: labelText, prefixIcon: prefixIcon),
                  expands: false,
                )),
            const SizedBox(height: AppSizes.spaceBtwSection),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => updateController.updateUserInfo(),
                  child: const Text('Save'),
                ),
              ),
            ),
          ])),
    );
  }
}
