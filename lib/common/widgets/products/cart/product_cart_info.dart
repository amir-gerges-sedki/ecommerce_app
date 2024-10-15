import 'package:flutter/material.dart';
import 'package:master_store/common/widgets/text/category_title.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/shop/model/cart_model.dart';

class ProductCartInfo extends StatelessWidget {
  const ProductCartInfo({
    super.key,
    required this.cartItemModel,
  });
  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(cartItemModel.name.toString()),
        const SizedBox(height: AppSizes.xs),
        CategoryTitle(title: cartItemModel.lineName.toString()),
        const SizedBox(height: AppSizes.sm),
        Row(
          children: (cartItemModel.selectedVariation ?? {})
              .entries
              .map((e) => Row(
                    children: [
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColor.darkerGrey.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.circular(AppSizes.borderRadiusSm),
                        ),
                        child: Text(
                          e.key.toString(),
                          textAlign: TextAlign.center,
                          style: AppTextTheme.darkTextTheme.labelMedium,
                        ),
                      ),
                      const SizedBox(width: AppSizes.sm),
                      Text(
                        e.value.toString(),
                        textAlign: TextAlign.center,
                        style: AppTextTheme.darkTextTheme.labelMedium,
                      ),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }
}
