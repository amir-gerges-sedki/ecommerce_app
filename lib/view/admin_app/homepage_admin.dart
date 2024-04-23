import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/controller/admin_app/crud_firebase_controller.dart';
import 'package:master_store/core/constant/color.dart';
import 'package:master_store/core/constant/routes_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CRUDCategoryControllerImp>(
        init: CRUDCategoryControllerImp(),
        builder: (controller) {
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.offNamed(AppRoute.addCategory);
                },
                child: const Icon(Icons.add),
              ),
              appBar: AppBar(title: const Text("data")),
              backgroundColor: ColorTheme.grey,
              body: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: GridView.builder(
                        itemCount: controller.data.length,
                        padding: const EdgeInsets.all(10),
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, mainAxisExtent: 160),
                        itemBuilder: (context, i) {
                          return InkWell(
                            onLongPress: () {
                              AwesomeDialog(
                                  context: context,
                                  title: "Delete the categoy",
                                  btnCancelOnPress: () async {
                                    await Get.toNamed(AppRoute.updateCategory);
                                  },
                                  btnOkOnPress: () {
                                    controller.deleteCategory(i);
                                  }).show();
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              color: const Color.fromARGB(255, 231, 228, 228),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/logo.png',
                                      height: 100,
                                    ),
                                    Text(
                                      "${controller.data[i]['categoryName']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 10),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ));
        });
  }
}
