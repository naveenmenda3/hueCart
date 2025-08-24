import 'package:flutter/material.dart';
import 'package:huecart/utils/constants/colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key, this.width=400, this.height=400, this.radius = 400,  this.padding, this.child, this.backgroundColor=AppColors.white,
  });
  final double? width;
  final double? height;
  final double radius;
  final double? padding;
  final Widget? child;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
