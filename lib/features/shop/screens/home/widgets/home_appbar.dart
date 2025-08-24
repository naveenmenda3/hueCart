import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/icons/circular_icons.dart';
import 'package:huecart/features/shop/screens/cart/cart.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good day for shopping',
              style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColors.grey),
            ),
            Text(
              'John Doe',
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.white),
            ),
          ],
        ),
      actions: [
        CircularIcon(
          icon: Iconsax.notification,
          onPressed: () {},
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        CircularIcon(
          color: Colors.pink,
          icon: Iconsax.shopping_cart,
          onPressed: () => Get.to(() => const CartScreen()),
        ),
      ],
    );
  }
} 