import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/icons/circular_icons.dart';
import 'package:huecart/features/authentication/screens/widgets/custom_button.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:huecart/controllers/cart_controller.dart';

class BottomAddToCartWidget extends StatelessWidget {
  const BottomAddToCartWidget({
    super.key,
    required this.productId,
    required this.productName,
    required this.price,
    required this.imageUrl,
  });

  final String productId;
  final String productName;
  final double price;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final quantity = 1.obs;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      decoration: const BoxDecoration(
        color: AppColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                backgroundColor: AppColors.darkGrey,
                width: 40,
                height: 40,
                color: AppColors.white,
                onPressed: () {
                  if (quantity.value > 1) {
                    quantity.value--;
                  }
                },
              ),
              const SizedBox(width: 22),
              Obx(() => Text(
                    quantity.value.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              const SizedBox(width: 22),
              CircularIcon(
                icon: Iconsax.add,
                backgroundColor: AppColors.black,
                width: 40,
                height: 40,
                color: AppColors.white,
                onPressed: () {
                  quantity.value++;
                },
              ),
            ],
          ),
          const SizedBox(width: 10),
          Flexible(
            child: CustomButton(
              onTap: () async {
                try {
                  await cartController.addToCart(
                    productId: productId,
                    productName: productName,
                    price: price,
                    imageUrl: imageUrl,
                    quantity: quantity.value,
                  );
                  Get.snackbar(
                    'Success',
                    'Product added to cart',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } catch (e) {
                  Get.snackbar(
                    'Error',
                    'Failed to add product to cart',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              buttonText: 'Add to Cart',
              buttonColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
