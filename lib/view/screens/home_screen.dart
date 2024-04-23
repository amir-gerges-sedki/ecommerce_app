import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/controller/home_screen_controller.dart';
import 'package:master_store/core/constant/color.dart';
import 'package:master_store/view/widgets/custom_appbar.dart';
import 'package:master_store/view/widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              backgroundColor: ColorTheme.grey,
              floatingActionButton: FloatingActionButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                child: const Icon(Icons.search),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
                  
              bottomNavigationBar: BottomAppBar(
                height: 68,
                color: const Color.fromARGB(255, 231, 228, 228),
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 10,
                  child: Row(
                    children: [
                      ...List.generate((controller.listPage.length + 1),
                          (index) {
                        int i = index > 2 ? index - 1 : index;
                        return index == 2
                            ? const Spacer()
                            : CustomAppBar(
                                active:controller.currentpage == i ? true : false,
                                text: controller.titleButtom[i],
                                onPressed: () {
                                  controller.changePage(i);
                                },
                                icon: controller.iconButtom[i],
                              );
                      })
                    ],
                  )),
              appBar: AppBar(
                backgroundColor: ColorTheme.grey,
                elevation: 0,
                title: Text(
                  'Master Vape',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: DataSearch());
                    },
                    icon: const Icon(Icons.search),
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                    color: Colors.black,
                  ),
                ],
              ),
              body: controller.listPage.elementAt(controller.currentpage)
            ));
  }
}