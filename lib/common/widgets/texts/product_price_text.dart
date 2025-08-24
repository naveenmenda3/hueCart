import 'package:flutter/material.dart';
import 'package:huecart/utils/constants/colors.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    required this.price,
    this.isLarge = false,
    this.lineThrough = false,
    this.maxLines = 1,
    this.textAlign,
  });

  final String price;
  final bool isLarge;
  final bool lineThrough;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$$price',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null,
              )
          : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null,
                color: AppColors.primary,
              ),
    );
  }
}
