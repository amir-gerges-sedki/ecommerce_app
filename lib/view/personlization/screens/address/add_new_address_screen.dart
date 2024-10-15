import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/validator.dart/validator.dart';
import 'package:master_store/view/shop/controller/products/addresses_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressesController());

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(' Add new address'),
        showBachArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(children: [
              TextFormField(
                controller: controller.name,
                validator: (val) => AppValidator.validEmptyField('Name', val),
                autofocus: true,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  label: Text('Name'),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.phoneNumber,
                validator: (val) => AppValidator.validatorPhone(val),
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  label: Text('Phone Number'),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.street,
                validator: (val) =>
                    AppValidator.validEmptyField('home and street', val),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.home_outlined),
                  label: Text('home and street'),
                ),
              ),
              TextFormField(
                controller: controller.state,
                validator: (val) => AppValidator.validEmptyField('state', val),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.home_outlined),
                  label: Text('state'),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.city,
                validator: (val) => AppValidator.validEmptyField('City', val),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_city_outlined),
                  label: Text('City'),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwSection),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        controller.addNewAddress();
                      },
                      child: const Text('Save'))),
            ]),
          ),
        ),
      ),
    );
  }
}
