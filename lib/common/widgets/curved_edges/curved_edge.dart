import 'package:flutter/material.dart';
import 'package:master_store/common/widgets/curved_edges/custom_curves_edge.dart';

class CurvedEdge extends StatelessWidget {
  const CurvedEdge({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvesEdge(),
      child: child,
    );
  }
}
