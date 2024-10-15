import 'package:flutter/material.dart';

import 'package:master_store/common/widgets/products/icons/circular_icon.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';

class CounterProductCart extends StatelessWidget {
  const CounterProductCart({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
    required this.price,
  });
  final int quantity, price;

  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularIcon(
                backgroundcolor: AppColor.darkGrey.withOpacity(0.3),
                width: 32,
                height: 32,
                size: AppSizes.lg,
                color: AppColor.black,
                icon: Icons.keyboard_arrow_down,
                onPressed: remove,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: Text('$quantity')),
              CircularIcon(
                backgroundcolor: AppColor.primary,
                width: 32,
                height: 32,
                size: AppSizes.lg,
                color: AppColor.black,
                icon: Icons.keyboard_arrow_up,
                onPressed: add,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        (Text('$price egp'))
      ],
    );
  }
}
