import 'package:flutter/material.dart';
import 'package:huecart/utils/constants/colors.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    this.color,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w900, color: AppColors.black),
    );
  }
}
