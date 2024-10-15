import 'package:get/get.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/data/repositories/subCollection/sub_collection_repo.dart';
import 'package:master_store/view/shop/model/sub_category_model.dart';

class SubCategoryController extends GetxController {
  static SubCategoryController get instance => Get.find();

  final isLoading = false.obs;
  late final SubCollectionRepo
      _subCategory; // Declare without initializing first
  RxList<SubCategoryModel> allTypes = <SubCategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    final String linesId = getLinesId(); // Get a valid linesId
    if (linesId.isNotEmpty) {
      _subCategory = Get.put(
          SubCollectionRepo(linesId: linesId)); // Initialize only if valid
      fetchCategories();
    } else {
      HelperFun.errorSnackbar(
          title: 'Invalid linesId', message: 'Lines ID cannot be empty.');
    }
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      // fetch categories
      final subCategory = await _subCategory.getSubCategories();
      // update list
      allTypes.assignAll(subCategory);
      print('subCategory: $subCategory');
    } catch (e) {
      HelperFun.errorSnackbar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getLinesId() {
    // Add logic to fetch or retrieve a valid linesId
    // Return a non-empty string here
    return 'valid_lines_id'; // Example, replace with real logic
  }
}
