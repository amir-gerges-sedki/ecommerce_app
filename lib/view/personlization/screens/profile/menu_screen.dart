// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:master_store/common/buttonlang.dart';
// import 'package:master_store/controller/menu_screen_controller.dart';
// import 'package:master_store/core/constant/app_colors.dart';
// import 'package:master_store/core/localization/localecontroller.dart';

// class Menu extends GetView<LocaleController> {
//   const Menu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     MenuScreenControllerImp signoutcontroller = MenuScreenControllerImp();
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: const EdgeInsets.only(top: 15.0),
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(left: 15, top: 10),
//                 height: 50,
//                 width: double.infinity,
//                 margin: const EdgeInsets.only(top: 20, bottom: 15),
//                 color: const Color.fromARGB(255, 202, 195, 195),
//                 child: const Text(
//                   "Settings",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 116, 21, 224)),
//                 ),
//               ),
//               InkWell(
//                 highlightColor: Colors.purple,
//                 onTap: () {
//                   Get.defaultDialog(
//                     title: '',
//                     content: Column(
//                       children: [
//                         ButtonLang(
//                           lang: 'Ar',
//                           onPressed: () {
//                             controller.changeLang("ar");
//                             Get.back();
//                           },
//                         ),
//                         const SizedBox(height: 8),
//                         ButtonLang(
//                           lang: 'En',
//                           onPressed: () {
//                             controller.changeLang("en");
//                             Get.back();
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 child: const Padding(
//                   padding: EdgeInsets.all(10.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.language,
//                             size: 17,
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(
//                             "Language",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 0, 0, 0)),
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.language,
//                             size: 25,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const InkWell(
//                 child: Padding(
//                   padding: EdgeInsets.all(10.0),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.currency_pound_rounded,
//                         size: 17,
//                       ),
//                       SizedBox(
//                         width: 12,
//                       ),
//                       Text(
//                         "Currency",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 0, 0, 0)),
//                       ),
//                       Spacer(),
//                       Text(
//                         'EGP',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                             color: AppColor.dark),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: const Padding(
//                   padding: EdgeInsets.all(10.0),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.phone,
//                         size: 17,
//                       ),
//                       SizedBox(
//                         width: 12,
//                       ),
//                       Text(
//                         "Call Us",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 0, 0, 0)),
//                       ),
//                       Spacer(),
//                       Icon(Icons.phone)
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   signoutcontroller.signOut();
//                 },
//                 child: const Row(
//                   children: [
//                     Text('log out'),
//                     Spacer(),
//                     Icon(Icons.logout_outlined)
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
