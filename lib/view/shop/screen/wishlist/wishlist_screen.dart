import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';
import 'package:master_store/common/widgets/cloud_helper_fun/cloud_helper_fun.dart';
import 'package:master_store/common/widgets/laylouts/grid_layouts.dart';
import 'package:master_store/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:master_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/view/shop/controller/favourite_controller.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favouriteController = FavouriteController.instance;

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('WishList'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.md - 6),
          child: Column(
            children: [
              Obx(() => FutureBuilder(
                  future: favouriteController.favouriteProducts(),
                  builder: (context, snapshot) {
                    const loader = VerticalProductShimmer(itemCount: 6);
                    final widget = CloudHelperFun.checkRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;
                    final productCount = snapshot.data!;
                    return GridLayouts(
                        itemCount: productCount.length,
                        mainAxisExtent: 250,
                        itemBuilder: (_, item) => ProductCardVertical(
                              liquid: productCount[item],
                              produtId: '',
                            ));
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
