import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:huecart/common/widgets/images/rounded_image.dart';
import 'package:huecart/common/widgets/images/t_rounded_image.dart';
import 'package:huecart/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:huecart/common/widgets/texts/product_title_text.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/image_strings.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
class TBrandCard extends StatelessWidget {
  /// Default constructor for the TBrandCard.
  ///
  /// Parameters:
  ///   - brand: The brand model to display.
  ///   - showBorder: A flag indicating whether to show a border around the card.
  ///   - onTap: Callback function when the card is tapped.
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,

      /// Container Design
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- Icon
            Flexible(
              child: RoundedImage(

                imageUrl: NImages.nikeLogo, // Use a brand logo constant from NImages
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            /// -- Texts
            // [Expanded] & Column [MainAxisSize.min] is important to keep the elements in the vertical center and also
            // to keep text inside the boundaries.
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
