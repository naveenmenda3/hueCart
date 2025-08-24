import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
import 'package:huecart/controllers/cart_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Checkout',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TSectionHeading(
                    title: 'Order Items',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  CartItems(
                    showAddRemoveButton: true,
                    cartItems: cartController.cartItems,
                    onQuantityChanged: cartController.updateItemQuantity,
                    onRemoveItem: cartController.removeFromCart,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: 'Payment Method',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Add payment method selection here
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: 'Shipping Address',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Add shipping address selection here
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            // Add checkout logic here
          },
          child: Text('Place Order \$${cartController.totalAmount.value.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}
