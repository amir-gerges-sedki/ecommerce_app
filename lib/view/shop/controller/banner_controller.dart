import 'package:get/get.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/data/repositories/banner/banner_repo.dart';
import 'package:master_store/view/shop/model/banner_model.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final isLoading = false.obs;
  final carusolCurrentItem = 0.obs;
  RxList<BannerModel> allBanner = <BannerModel>[].obs;
  final _bannerRepo = Get.put(BannerRepo());

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndecator(index) {
    carusolCurrentItem.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final banners = await _bannerRepo.fetchBanners();
      allBanner.assignAll(banners);

      //fetch categories
    } catch (e) {
      HelperFun.errorSnackbar(title: 'oh Snap');
    } finally {
      isLoading.value = false;
    }
  }
}
