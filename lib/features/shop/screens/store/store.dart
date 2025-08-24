import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/appbar/tabbar.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:huecart/common/widgets/layouts/BrandCard.dart';
import 'package:huecart/common/widgets/layouts/grid_layout.dart';
import 'package:huecart/common/widgets/products/cart_menu.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/features/shop/screens/brand/all_brands.dart';
import 'package:huecart/features/shop/screens/store/widgets/category_tab.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
// First, add the import at the top if not already present
import 'package:huecart/utils/constants/image_strings.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium!.apply(color: dark? AppColors.white: AppColors.dark,
                fontWeightDelta: 2
              ),
            ),
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? AppColors.dark : AppColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const SearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      TSectionHeading(
                        title: 'Featured Brands',
                        showActionButton: true,
                        onPressed: () {
                          Get.to(() => const AllBrandsScreen());
                        },
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) => Container(
                          width: 56,
                          padding: const EdgeInsets.all(TSizes.sm),
                          decoration: BoxDecoration(
                            color: dark ? AppColors.darkerGrey : AppColors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Image(
                              // Then replace this line
                              // With
                              image: AssetImage(NImages.nikeLogo), // Or use another brand logo constant as needed
                              color: dark ? AppColors.white : AppColors.dark,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
