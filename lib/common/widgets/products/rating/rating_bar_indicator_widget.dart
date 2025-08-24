import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class RatingBarIndicatorWidget extends StatelessWidget {
  const RatingBarIndicatorWidget({
    super.key,
    required this.rating,
  });
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        itemBuilder: (_, __) => const Icon(
              Iconsax.star1,
              color: AppColors.primary,
            ));
  }
}
