import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_strings.dart';

class TextSpanButton extends StatelessWidget {
  const TextSpanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(TextSpan(
            children: [TextSpan(text: AppStrings.alreadyHaveAccount)])),
        InkWell(
          // onTap: () => controller.goToLogin(),
          child: Text(AppStrings.login,
              style: TextStyle(
                  color: AppColor.primary, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
