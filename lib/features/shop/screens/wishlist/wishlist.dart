import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/layouts/grid_layout.dart';
import 'package:huecart/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:huecart/controllers/wishlist_controller.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WishlistController>();
    
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: const Text('Wishlist',style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
        ),
        actions: [
          IconButton(
            onPressed: () => controller.clearWishlist(),
            icon: Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: const Icon(Iconsax.trash,size: 25,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => controller.wishlistItems.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Iconsax.heart, size: 60, color: AppColors.grey),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      'Your wishlist is empty',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      'Add items to your wishlist',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: GridLayout(
                    itemCount: controller.wishlistItems.length,
                    itemBuilder: (_, index) {
                      final product = controller.wishlistItems[index];
                      return ProductCardVertical(
                        productId: product['productId'],
                        productName: product['name'],
                        price: product['price'],
                        imageUrl: product['imageUrl'],
                        isWishlist: true,
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
