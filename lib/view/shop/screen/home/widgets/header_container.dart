import 'package:flutter/material.dart';
import 'package:master_store/common/widgets/curved_edges/curved_edge.dart';
import 'package:master_store/common/widgets/custom_shape/circlular_container.dart';
import 'package:master_store/core/constant/app_colors.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdge(
      child: Container(
        color: AppColor.primary.withOpacity(0.9),
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              right: -250,
              top: -150,
              child: CirclulerContainer(
                width: 400,
                height: 300,
                radius: 400,
                padding: 0,
                background: AppColor.white.withOpacity(0.1),
                child: null,
              ),
            ),
            Positioned(
              top: 100,
              right: -350,
              // left: -150,
              child: CirclulerContainer(
                width: 400,
                height: 400,
                radius: 400,
                padding: 0,
                background: AppColor.white.withOpacity(0.1),
                child: null,
              ),
            ),
            Positioned(
              top: 360,

              // left: -150,
              child: CirclulerContainer(
                width: 400,
                height: 400,
                radius: 400,
                padding: 0,
                background: AppColor.white.withOpacity(0.1),
                child: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
