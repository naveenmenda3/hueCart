import 'package:huecart/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ShodowStyle {
  static final verticalProductShadow = BoxShadow(
    color: AppColors.darkGrey.withOpacity(1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
  static final horizontalProductShadow = BoxShadow(
    color: AppColors.darkGrey.withOpacity(1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
