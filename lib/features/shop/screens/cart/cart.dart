import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:huecart/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:huecart/features/shop/screens/checkout/checkout.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      body: Obx(() {
        if (cartController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (cartController.cartItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_cart_outlined, size: 80, color: AppColors.grey),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  'Your cart is empty',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Continue Shopping'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    TAppBar(
                      title: Text(
                        'Cart',
                        style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.white),
                      ),
                      showBackArrow: true,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: CartItems(
                  showAddRemoveButton: true,
                  cartItems: cartController.cartItems,
                  onQuantityChanged: (productId, quantity) {
                    cartController.updateItemQuantity(productId, quantity);
                  },
                  onRemoveItem: (productId) {
                    cartController.removeFromCart(productId);
                  },
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        if (cartController.cartItems.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Text('Checkout \$${cartController.totalAmount.value.toStringAsFixed(2)}'),
          ),
        );
      }),
    );
  }
}