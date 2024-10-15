// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:master_store/controller/categories_screen_controller.dart';
// import 'package:master_store/core/constant/app_routes.dart';

// import 'package:master_store/common/widgets/custom_shape/custom_searc.dart';

// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // CategoriesScreenController controller =
//     //     Get.put(CategoriesScreenController());

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Liqueds'),
//         actions: [
//           Expanded(
//               child: CustomSearch(
//             title: 'search...',
//             showBackground: true,
//             showBorder: true,
//           )),
//         ],
//       ),
//       body: Padding(
//           padding: const EdgeInsets.only(top: 20.0),
//           child: GridView.builder(
//             itemCount: controller.results.isEmpty
//                 ? controller.data.length
//                 : controller.results.length,
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 200,
//               mainAxisSpacing: 9.0,
//               crossAxisSpacing: 6.0,
//               childAspectRatio: .8,
//             ),
//             itemBuilder: (_, index) {
//               var item = controller.results.isEmpty
//                   ? controller.data[index].data() as Map<String, dynamic>
//                   : controller.results[index];
//               return Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.white,
//                 ),
//                 padding: const EdgeInsets.all(10),
//                 margin: const EdgeInsets.only(right: 10),
//                 child: InkWell(
//                   onTap: () {
//                     Get.toNamed(AppRoute.categoriesScreen);
//                   },
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Image.network(
//                         item['image'],
//                         fit: BoxFit.cover,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           )),
//     );
//   }
// }
