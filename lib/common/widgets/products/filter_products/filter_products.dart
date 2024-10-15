import 'package:flutter/material.dart';

import 'package:master_store/common/widgets/laylouts/grid_layouts.dart';
import 'package:master_store/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:master_store/view/shop/model/liquid_product_model.dart';

class FilterProducts extends StatelessWidget {
  const FilterProducts(
      {super.key, required this.items, required this.itemCount});

  final List<DropdownMenuItem<String>> items; // specify String type for IDs
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          items: items,
          onChanged: (value) {
            // Handle category change here
            print('Selected category ID: $value');
          },
        ),
        // GridLayouts(
        //   itemCount: itemCount,
        //   itemBuilder: (_, item) => ProductCardVertical(
        //     liquid: LiquidProductModel.empty(),
        //   ),
        // ),
      ],
    );
  }
}
