import 'package:flutter/material.dart';

import 'curved_edges.dart';

class VCurvedEdgeWidget extends StatelessWidget {
  const VCurvedEdgeWidget({
    super.key, this.child,
  });
  final Widget ? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: VCustomCurvedEdges(),
      child:child,
    );
  }
}

