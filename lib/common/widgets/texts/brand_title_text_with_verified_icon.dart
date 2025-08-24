import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';

enum TextSizes { small, medium, large }

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = AppColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor;
  final Color? iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            title,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: brandTextSize == TextSizes.small
                ? Theme.of(context).textTheme.labelMedium!.apply(color: textColor)
                : brandTextSize == TextSizes.medium
                    ? Theme.of(context).textTheme.bodyLarge!.apply(color: textColor)
                    : Theme.of(context).textTheme.titleLarge!.apply(color: textColor),
          ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: TSizes.iconXs),
      ],
    );
  }
} 