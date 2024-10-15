import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';
import 'package:master_store/common/widgets/cloud_helper_fun/cloud_helper_fun.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/personlization/screens/address/widgets/address_card.dart';
import 'package:master_store/view/shop/controller/products/addresses_controller.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressesController());
    return Scaffold(
      appBar: CustomAppBar(
          title: Text('Addresses',
              style: AppTextTheme.darkTextTheme.headlineSmall),
          showBachArrow: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoute.addNewAddresses),
        backgroundColor: AppColor.primary,
        child: const Icon(Icons.add_location_alt),
      ),
      body: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  final response =
                      CloudHelperFun.checkRecordState(snapshot: snapshot);
                  if (response != null) return response;
                  final address = snapshot.data!;

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: address.length,
                      itemBuilder: (_, item) => AddressCard(
                            onTap: () =>
                                controller.selectAddress(address[item]),
                            addressesModel: address[item],
                          ));
                }),
          )),
    );
  }
}
