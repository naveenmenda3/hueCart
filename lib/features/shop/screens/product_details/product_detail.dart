import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/features/authentication/screens/widgets/custom_button.dart';
import 'package:huecart/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:huecart/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:huecart/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:huecart/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
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
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: dark ? AppColors.dark : AppColors.white,

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: dark ? AppColors.darkGrey : Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            // Price Text with bounded width and styles
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
              ),
            ),
            const Spacer(),

            // Buy Now Button constrained with fixed size
            SizedBox(
              height: 50,
              width: 180,
              child: CustomButton(
                onTap: () {
                  // Navigate to checkout
                },
                buttonText: 'Buy Now',
              ),
            )
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ProductDetailImageSlider(imageUrl: imageUrl,),
              ),

              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RatingAndShare(),
                    const SizedBox(height: 10),

                    Text(
                      productName,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      'Only few left in stock!',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Product attributes widget, assumed to have bounded constraints
                    const ProductAttributes(),
                    const SizedBox(height: 20),

                    const TSectionHeading(title: 'Description'),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    const ReadMoreText(
                      'This is a premium product crafted with quality in mind. Whether you are looking for performance, comfort or style, this product checks all boxes.',
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Show more',
                      trimExpandedText: ' Less',
                      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),

                    const Divider(height: 40),

                    GestureDetector(
                      onTap: () {
                           Get.to(() => const ProductReviewsScreen());
                        },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Customer Reviews",style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),),
                          Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
