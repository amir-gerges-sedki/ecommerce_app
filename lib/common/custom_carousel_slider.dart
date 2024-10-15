// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:master_store/controller/home_screen_controller.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class CustomCarouselSlider extends StatelessWidget {
//   const CustomCarouselSlider({
//     super.key,
//     required this.categoriesController,
//     required this.homeController,
//   });

//   final CategoriesScreenController categoriesController;
//   final HomeScreenControllerImp homeController;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeScreenControllerImp>(
//       builder: (homeController) => Stack(
//         children: [
//           CarouselSlider(
//             carouselController: homeController.carouselController,
//             options: CarouselOptions(
//               onPageChanged: (index, reason) {
//                 homeController.pageView(index);
//                 homeController.currentSlider = index;
//               },
//               aspectRatio: 19 / 9,
//               viewportFraction: 1.0,
//               initialPage: 0,
//               enableInfiniteScroll: true,
//               reverse: false,
//               autoPlay: true,
//               autoPlayInterval: const Duration(seconds: 3),
//               autoPlayAnimationDuration: const Duration(milliseconds: 800),
//               autoPlayCurve: Curves.fastOutSlowIn,
//               enlargeCenterPage: true,
//               enlargeFactor: 0.3,
//               scrollDirection: Axis.horizontal,
//             ),
//             items: categoriesController.data.map((i) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Image.asset(
//                       'assets/liq.png',
//                       fit: BoxFit.fitWidth,
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//           ),
//           Positioned(
//             bottom: 0.1,
//             left: 120,
//             child: AnimatedSmoothIndicator(
//               activeIndex: homeController.currentSlider,
//               count: categoriesController.data.length,
//               effect: const JumpingDotEffect(
//                 dotHeight: 7,
//                 dotWidth: 18,
//                 jumpScale: 1,
//                 verticalOffset: 10,
//                 activeDotColor: Colors.deepPurple,
//                 dotColor: Color.fromARGB(255, 109, 106, 106),
//               ), // Change this if necessary
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
