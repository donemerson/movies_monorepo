import 'package:movies_flix/app/resources/my_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AnimatedShimmer extends StatelessWidget {
  final Size size;
  final BorderRadius borderRadius;
  final Duration period;
  const AnimatedShimmer({
    Key? key,
    required this.size,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.period = const Duration(milliseconds: 1500),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.shimmerBaseColor,
      highlightColor: MyColors.shimmerHighlightColor,
      period: period,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
        width: size.width,
        height: size.height,
      ),
    );
  }
}
