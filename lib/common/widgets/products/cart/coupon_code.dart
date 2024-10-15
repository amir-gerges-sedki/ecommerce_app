import 'package:flutter/material.dart';
import 'package:master_store/common/widgets/custom_shape/rounded_container.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/helper/helper.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFun.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? AppColor.dark : AppColor.white,
      padding: const EdgeInsets.only(
          top: AppSizes.sm,
          bottom: AppSizes.sm,
          right: AppSizes.sm,
          left: AppSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: AppStrings.promoCode,
                hintStyle: TextStyle(color: AppColor.darkGrey),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark
                        ? AppColor.white.withOpacity(.5)
                        : AppColor.dark.withOpacity(.5),
                    backgroundColor: AppColor.grey.withOpacity(.2),
                    side: BorderSide(color: AppColor.grey.withOpacity(.1))),
                onPressed: () {},
                child: Text(
                  AppStrings.apply,
                  style: TextStyle(color: AppColor.white.withOpacity(0.7)),
                )),
          )
        ],
      ),
    );
  }
}
