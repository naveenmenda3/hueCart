import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:huecart/common/widgets/icons/circular_icons.dart';
import 'package:huecart/common/widgets/layouts/grid_layout.dart';
import 'package:huecart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/features/shop/screens/cart/cart.dart';
import 'package:huecart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:huecart/features/shop/screens/home/widgets/home_categories.dart';
import 'package:huecart/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/image_strings.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Add this list of sample products
  final List<Map<String, dynamic>> products = [
    {
      'id': 'product-1',
      'name': 'Nike Air Max',
      'price': 199.99,
      'imageUrl': NImages.product1,
    },
    {
      'id': 'product-2',
      'name': 'Adidas Ultraboost',
      'price': 179.99,
      'imageUrl': NImages.productImage2,
    },
    {
      'id': 'product-3',
      'name': 'Puma RS-X',
      'price': 149.99,
      'imageUrl': NImages.productImage3,
    },
    {
      'id': 'product-4',
      'name': 'Reebok Classic',
      'price': 89.99,
      'imageUrl': NImages.productImage4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good day for shopping',

              style: Theme.of(context).textTheme.labelMedium!.apply(color: dark? AppColors.white: AppColors.dark,fontWeightDelta: 2),
            ),
            Text(
              'Berin',
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: dark? AppColors.white: AppColors.dark,fontWeightDelta: 2),
            ),
          ],
        ),
        actions: [
          CircularIcon(
            color: dark? AppColors.white: AppColors.dark,
            icon: Iconsax.notification,
            onPressed: () {},
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          CircularIcon(
            color: dark? AppColors.white: AppColors.dark,

            icon: Iconsax.shopping_cart,
            onPressed: () => Get.to(() => const CartScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  SizedBox(height: TSizes.spaceBtwSections),
                  SearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: AppColors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        HomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PromoSlider(
                    banners: [
                      NImages.promoBanner1,
                      NImages.promoBanner2,
                      NImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () {

                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Update the GridLayout itemBuilder
                  GridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => ProductCardVertical(
                      productId: products[index]['id'],
                      productName: products[index]['name'],
                      price: products[index]['price'],
                      imageUrl: products[index]['imageUrl'],
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
