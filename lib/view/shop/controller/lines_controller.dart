import 'package:get/get.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/data/repositories/lines/lines_repo.dart';
import 'package:master_store/view/shop/model/lines_model.dart';

class LinesController extends GetxController {
  static LinesController get instance => Get.find();

  final isLoading = false.obs;
  final _linesRepo = Get.put(LinesRepo());
  RxList<LinesModel> allLines = <LinesModel>[].obs;
  RxList<LinesModel> featuredLines = <LinesModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      //fetch categories
      final lines = await _linesRepo.getLines();
      //update list
      allLines.assignAll(lines);
      // filter featured category
      featuredLines.assignAll(allLines
          .where((lines) => lines.isFeature && lines.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      HelperFun.errorSnackbar(title: 'oh Snap');
    } finally {
      isLoading.value = false;
    }
  }
}
