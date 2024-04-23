import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/controller/admin_app/crud_firebase_controller.dart';
import 'package:master_store/core/constant/color.dart';
import 'package:master_store/view/widgets/admin_app/custom_form_field.dart';
import 'package:master_store/view/widgets/auth/coustom_material_button.dart';
import 'package:master_store/view/widgets/auth/custom_logo.dart';

class UpdateCategory extends StatelessWidget {
  const UpdateCategory({super.key});

  @override
  Widget build(BuildContext context) {
    CRUDCategoryControllerImp controller = Get.put(CRUDCategoryControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.grey,
          elevation: 0,
          title: Text(
            'Add Category',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: Form(
          key: controller.CategoryKey,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 60,
            ),
            child: ListView(
              children: [
                const CustomLogo(
                  title: 'Update Category',
                ),
                CustomFromFeildAdmin(
                  title: 'Category',
                  hinttitle: 'category',
                  controller: controller.categoryName,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: MAtrialButton(
                      onPressed: () {
                        controller.updateCategory(controller.categoryName);
                      },
                      color: const Color.fromARGB(255, 4, 122, 107),
                      textColor: Colors.white,
                      title: 'Save'),
                ),
              ],
            ),
          ),
        ));
  }
}
