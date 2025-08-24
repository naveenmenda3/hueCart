import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/icons/circular_icons.dart';
import 'package:huecart/features/shop/screens/product_details/product_detail.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:huecart/utils/constants/image_strings.dart';
// Add this import at the top with other imports
import 'package:huecart/controllers/wishlist_controller.dart';

class ProductCardVertical extends StatelessWidget {
  final String productId;
  final String productName;
  final double price;
  final String imageUrl;
  final bool isWishlist;

  const ProductCardVertical({
    super.key,
    required this.productId,
    required this.productName,
    required this.price,
    required this.imageUrl,
    this.isWishlist = false,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.find<WishlistController>();

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
        productId: productId,
        productName: productName,
        price: price,
        imageUrl: imageUrl,
      )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: dark ? AppColors.darkerGrey : AppColors.white,
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.1),
              blurRadius: 50,
              spreadRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: dark ? AppColors.dark : AppColors.light,
                borderRadius: BorderRadius.circular(TSizes.productImageRadius),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image(
                      image: const AssetImage(NImages.product1), // Update image reference
                      color: dark ? AppColors.white : AppColors.dark,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Obx(
                      () => CircularIcon(
                        icon: controller.isInWishlist(productId) ? Iconsax.heart5 : Iconsax.heart,
                        color: controller.isInWishlist(productId) ? Colors.red : null,
                        onPressed: () async {
                          try {
                            if (controller.isInWishlist(productId)) {
                              await controller.removeFromWishlist(productId);
                            } else {
                              await controller.addToWishlist({
                                'productId': productId,
                                'name': productName,
                                'price': price,
                                'imageUrl': imageUrl,
                                'timestamp': DateTime.now().toIso8601String(), // Add timestamp for sorting
                              });
                            }
                          } catch (e) {
                            Get.snackbar('Error', 'Failed to update wishlist');
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName, // Use the actual product name
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        'Nike',
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: TSizes.xs),
                      const Icon(Iconsax.verify5, color: AppColors.primary, size: TSizes.iconXs),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm, bottom: TSizes.sm),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '\$${price.toStringAsFixed(2)}', // Use the actual price
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
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
