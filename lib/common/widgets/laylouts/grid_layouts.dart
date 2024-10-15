import 'package:flutter/material.dart';

class GridLayouts extends StatelessWidget {
  const GridLayouts(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent,
      required this.itemBuilder,
      this.crossAxisCount = 2});
  final int itemCount;
  final int crossAxisCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisExtent: mainAxisExtent,
            mainAxisSpacing: 15,
            crossAxisSpacing: 10),
        itemBuilder: itemBuilder);
  }
}
