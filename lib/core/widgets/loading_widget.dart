import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadiusGeometry;

  const ShimmerWidget({
    super.key,
    this.height,
    this.width,
    this.borderRadiusGeometry,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadiusGeometry ?? BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
