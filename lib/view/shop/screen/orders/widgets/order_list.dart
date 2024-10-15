import 'package:flutter/material.dart';
import 'package:master_store/common/widgets/custom_shape/rounded_container.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class OrderItemList extends StatelessWidget {
  const OrderItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFun.isDarkMode(context);
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (_, item) => RoundedContainer(
        padding: const EdgeInsets.all(AppSizes.md),
        showBorder: true,
        backgroundColor: dark ? AppColor.dark : AppColor.light,
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.shopping_bag),
                const SizedBox(width: AppSizes.spaceBtwItems / 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'processing',
                        style: AppTextTheme.darkTextTheme.bodyLarge!
                            .apply(color: AppColor.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        '23 oct 2025',
                        style: AppTextTheme.darkTextTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                  iconSize: AppSizes.iconSm,
                )
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Icons.sell_outlined),
                      const SizedBox(width: AppSizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Order',
                                style: AppTextTheme.darkTextTheme.labelMedium),
                            Text('23 oct 2025',
                                style: AppTextTheme.darkTextTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      const SizedBox(width: AppSizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Shipping date',
                                style: AppTextTheme.darkTextTheme.labelMedium),
                            Text('78ujlk',
                                style: AppTextTheme.darkTextTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      separatorBuilder: (_, __) =>
          const SizedBox(height: AppSizes.spaceBtwItems),
    );
  }
}
