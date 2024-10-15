import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/view/auth/screens/forgetpassword/widgets/submit_button.dart';
import 'package:master_store/view/auth/screens/forgetpassword/widgets/text_body.dart';
import 'package:master_store/view/auth/screens/forgetpassword/widgets/text_form.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                TextBody(),
                SizedBox(height: AppSizes.spaceBtwSection),
                TextForm(),
                SizedBox(height: AppSizes.spaceBtwSection),
                SubmitButton(),
              ],
            ),
          ),
        ));
  }
}
