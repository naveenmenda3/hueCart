import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:huecart/features/shop/screens/sub_category/sub_categories.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/image_strings.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return VerticalImageText(
            image: NImages.shoeIcon,
            title: 'Shoes',
            textColor: AppColors.white,
            onTap: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}

