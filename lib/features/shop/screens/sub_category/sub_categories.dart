import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/images/rounded_image.dart';
import 'package:huecart/common/widgets/products/products_card/product_card_horizontal.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/image_strings.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Sports'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const RoundedImage(
                width: double.infinity,
                imageUrl: NImages.promoBanner3,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: 20,
              ),

              /// Sub Categories
              Column(
                children: [
                  TSectionHeading(
                    title: 'Sports',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 15,
                            ),
                        itemBuilder: (context, index) =>
                            const ProductCardHorizontal()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
