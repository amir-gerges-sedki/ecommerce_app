import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_strings.dart';

class FormDivier extends StatelessWidget {
  const FormDivier({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            indent: 60,
            endIndent: 5,
            color: AppColor.darkGrey,
          ),
        ),
        Text(AppStrings.or),
        Flexible(
          child: Divider(
            indent: 5,
            endIndent: 60,
            color: AppColor.darkGrey,
          ),
        ),
      ],
    );
  }
}
