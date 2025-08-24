import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/brands/brand_title_text_verifed.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:huecart/common/widgets/images/circular_image.dart';
import 'package:huecart/common/widgets/texts/product_title_text.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/image_strings.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
    required this.title,
    required this.price,
  });

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price
        Row(
          children: [
            Text(
              "\$$price",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        /// title
        TProductTitleText(title: title),  // Changed from ProductTitleText
        const SizedBox(
          height: 10,
        ),

        /// stock status
        const Row(
          children: [
            TProductTitleText(title: 'Status'),  // Changed from ProductTitleText
            SizedBox(
              width: 10,
            ),
            Text(
              'In Stock',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.green,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        /// Brand
        const Row(
          children: [
            CircularImage(
              image: NImages.cosmeticsIcon,
              width: 40,
              height: 40,
              overlayColor: AppColors.black,
            ),
            SizedBox(
              width: 3,
            ),
            BrandTitleVerified(
              title: 'Nike',
            ),
          ],
        ),
      ],
    );
  }
}
