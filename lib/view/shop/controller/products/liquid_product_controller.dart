import 'package:get/get.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/data/repositories/liquids/liquid_repo.dart';
import 'package:master_store/view/shop/model/liquid_product_model.dart';

class LiquidProductController extends GetxController {
  static LiquidProductController get instance => Get.find();

  final isLoading = false.obs;
  final _liquidRepo = Get.put(LiquidsRepo());

  RxList<LiquidProductModel> allLiquids = <LiquidProductModel>[].obs;

  @override
  void onInit() {
    fetchLiquids();
    super.onInit();
  }

  Future<void> fetchLiquids() async {
    try {
      isLoading.value = true;

      //fetch categories
      final liquid = await _liquidRepo.getLiquid();
      //update list
      allLiquids.assignAll(liquid);
      // filter featured category
    } catch (e) {
      HelperFun.errorSnackbar(title: 'oh Snap');
    } finally {
      isLoading.value = false;
    }
  }
}
