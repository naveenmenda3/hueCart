import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/brands/brand_title_text_verifed.dart';
import 'package:huecart/common/widgets/images/rounded_image.dart';
import 'package:huecart/common/widgets/texts/product_title_text.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.onRemove,
  });

  final String imageUrl;
  final String title;
  final String price;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedImage(
          width: 60,
          height: 60,
          imageUrl: imageUrl,
          padding: const EdgeInsets.all(10),
          backgroundColor: AppColors.light,
        ),
        const SizedBox(
          width: 20,
        ),

        /// title, Price
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: TProductTitleText(  // Changed from ProductTitleText
                  title: title,
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onRemove,
          icon: const Icon(Iconsax.trash),
          color: Colors.red,
        ),
      ],
    );
  }
}
