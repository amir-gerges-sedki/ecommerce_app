import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_strings.dart';

class SpanTextSignup extends StatelessWidget {
  const SpanTextSignup({
    super.key,
    // required this.controller,
  });

  // final LoginControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text.rich(
            TextSpan(children: [TextSpan(text: AppStrings.noAccount)])),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoute.signup);
          },
          child: const Text(AppStrings.signup,
              style: TextStyle(
                  color: AppColor.primary, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
