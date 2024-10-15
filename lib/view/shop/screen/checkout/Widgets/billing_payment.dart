import 'package:flutter/material.dart';
import 'package:master_store/common/widgets/custom_shape/rounded_container.dart';
import 'package:master_store/common/widgets/text/section_title.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class BillingPayment extends StatelessWidget {
  const BillingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFun.isDarkMode(context);
    return Column(
      children: [
        SectionTitle(
            title: AppStrings.paymentMethod,
            textColor: AppColor.white,
            buttonTitle: AppStrings.change,
            onpressed: () {}),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            RoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? AppColor.light : AppColor.white,
                padding: const EdgeInsets.all(AppSizes.sm),
                child: const Image(
                    image: AssetImage(ImageAssets.visa), fit: BoxFit.contain)),
            const SizedBox(width: AppSizes.spaceBtwItems / 2),
            Text(AppStrings.visa, style: AppTextTheme.darkTextTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
