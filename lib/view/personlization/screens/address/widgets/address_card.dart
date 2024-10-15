import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/custom_shape/rounded_container.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/shop/controller/products/addresses_controller.dart';
import 'package:master_store/view/shop/model/addresses_model.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.onTap,
    required this.addressesModel,
  });

  final AddressesModel addressesModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFun.isDarkMode(context);
    final controller = AddressesController.instance;

    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final isSelected = selectedAddressId == addressesModel.id;

      return InkWell(
        onTap: onTap,
        child: RoundedContainer(
          width: double.infinity,
          showBorder: true,
          backgroundColor: isSelected
              ? AppColor.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: isSelected
              ? Colors.transparent
              : dark
                  ? AppColor.darkGrey
                  : AppColor.grey,
          margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 2,
                child: Icon(
                  isSelected ? Icons.check_circle_outline : null,
                  color: dark ? AppColor.light : AppColor.dark,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addressesModel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.darkTextTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSizes.sm / 2),
                    Text(
                      addressesModel.formattedPhoneNo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSizes.sm / 2),
                    Text(
                      addressesModel.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
