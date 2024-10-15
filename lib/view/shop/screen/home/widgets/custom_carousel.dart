import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/custom_shape/circlular_container.dart';
import 'package:master_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/view/shop/controller/banner_controller.dart';
import 'package:master_store/view/shop/screen/home/widgets/round_image.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
          () {
            if (bannerController.isLoading.value) {
              return const ShimmerEffect(width: double.infinity, height: 150);
            }
            return Column(
              children: [
                CarouselSlider(
                  items: bannerController.allBanner
                      .map((allBanner) => RoundImage(
                            url: allBanner.image,
                            isNetworkImage: true,
                            onTap: () => Get.toNamed(allBanner.targetScreen),
                            width: double.infinity,
                            height: 150,
                            padding: 10,
                          ))
                      .toList(),
                  options: CarouselOptions(
                      enableInfiniteScroll:
                          bannerController.allBanner.length == 1 ? false : true,
                      autoPlay:
                          bannerController.allBanner.length == 1 ? false : true,
                      viewportFraction: 1,
                      onPageChanged: (index, _) =>
                          bannerController.updatePageIndecator(index)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  if (bannerController.allBanner.length == 1) {
                    return const SizedBox();
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0;
                          i < bannerController.allBanner.length;
                          i++)
                        CirclulerContainer(
                          margin: 10,
                          width: 20,
                          height: 3,
                          radius: 400,
                          padding: 22,
                          background:
                              bannerController.carusolCurrentItem.value == i
                                  ? AppColor.primary
                                  : AppColor.darkGrey,
                        ),
                    ],
                  );
                })
              ],
            );
          },
        ));
  }
}
