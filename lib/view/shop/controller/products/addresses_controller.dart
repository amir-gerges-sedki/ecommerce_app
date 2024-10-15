import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/device/network_manager.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/data/repositories/addresses/addresses_repo.dart';
import 'package:master_store/view/shop/model/addresses_model.dart';

class AddressesController extends GetxController {
  static AddressesController get instance => Get.find();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  final Rx<AddressesModel> selectedAddress = AddressesModel.empty().obs;
  final addressRepo = Get.put(AddressesRepo());
  RxBool refreshData = true.obs;

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final city = TextEditingController();
  final street = TextEditingController();
  final state = TextEditingController();

  Future<List<AddressesModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepo.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (item) => item.selectedAddress,
          orElse: () => AddressesModel.empty());
      return addresses;
    } catch (e) {
      HelperFun.errorSnackbar(
          title: 'Address not Found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressesModel newSelectedAddress) async {
    try {
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepo.updateSelectedField(selectedAddress.value.id, false);
      }
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      await addressRepo.updateSelectedField(selectedAddress.value.id, true);
      Get.back();
    } catch (e) {
      HelperFun.errorSnackbar(
          title: 'error in Selection', message: e.toString());
    }
  }

  Future addNewAddress() async {
    try {
      HelperFun.openLoadingDialog('Adding Address', ImageAssets.liqued1);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HelperFun.stopLoader();
        HelperFun.errorSnackbar(
            title: 'No Internet Connection',
            message: 'Please check your network and try again.');
        return;
      }

      if (!addressFormKey.currentState!.validate()) {
        HelperFun.stopLoader();
        HelperFun.errorSnackbar(
            title: 'Invalid Data',
            message: 'Please correct the errors in the form.');
        return;
      }

      final address = AddressesModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        selectedAddress: true,
      );

      final id = await addressRepo.addAddress(address);
      address.id = id;
      selectedAddress(address);

      HelperFun.stopLoader();
      HelperFun.successnackbar(
          'Congratulations', 'Your address has been saved successfully.', 1);

      refreshData.toggle();
      resetFormFields();
      refreshData.toggle();
      update();

      Get.back();
    } catch (e) {
      HelperFun.stopLoader();
      HelperFun.errorSnackbar(
          title: 'Error in adding address', message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    city.clear();
    state.clear();
    addressFormKey.currentState?.reset();
  }
}
