import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:huecart/common/widgets/layouts/BrandCard.dart';
import 'package:huecart/utils/constants/colors.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: Colors.transparent,
      borderColor: AppColors.darkGrey,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          const TBrandCard(showBorder: false),
          const SizedBox(
            height: 10,
          ),
          Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList()),
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: TRoundedContainer(
    height: 100,
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.only(right: 10),
    backgroundColor: AppColors.light,
    child: Image(
      image: AssetImage(image),
      fit: BoxFit.contain,
    ),
  ));
}
