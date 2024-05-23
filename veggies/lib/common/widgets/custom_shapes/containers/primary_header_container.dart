import 'package:flutter/material.dart';
import '../../../../utils/constants/color.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class VPrimaryHeaderContainer extends StatelessWidget {
  const VPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return VCurvedEdgeWidget(
      child: Container(
        color: VColors.primary,
        child: Stack(
          children: [
            Positioned(
              right: -250,
              top: -150,
              child: VCircularContainer(
                backgroundColor: VColors.textWhite.withOpacity(0.1),
              ),
            ),
             Positioned(
              right: -300,
              top: 100,
              child: VCircularContainer(
                backgroundColor: VColors.textWhite.withOpacity(0.1),
              ),
            ),
            child, // Adding the provided child widget
          ],
        ),
      ),
    );
  }
}
