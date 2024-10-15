import 'package:flutter/material.dart';
import 'package:master_store/common/widgets/text/section_title.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class BillingAddresses extends StatelessWidget {
  const BillingAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
            title: AppStrings.shippingAddress,
            textColor: AppColor.white,
            buttonTitle: AppStrings.change,
            onpressed: () {}),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: AppColor.grey,
              size: 16,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text(
              '01227716033',
              style: AppTextTheme.darkTextTheme.bodySmall,
            )
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: AppColor.grey,
              size: 16,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text(
              '16 elsada street omrania Giza',
              style: AppTextTheme.darkTextTheme.bodySmall,
              softWrap: true,
            )
          ],
        ),
      ],
    );
  }
}
