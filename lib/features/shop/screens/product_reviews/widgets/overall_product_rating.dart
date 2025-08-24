import 'package:flutter/material.dart';
import 'package:huecart/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgressIndicator(
                text: '5',
                value: 1.0,
              ),
              RatingProgressIndicator(
                text: '4',
                value: 0.8,
              ),
              RatingProgressIndicator(
                text: '3',
                value: 0.6,
              ),
              RatingProgressIndicator(
                text: '2',
                value: 0.4,
              ),
              RatingProgressIndicator(
                text: '1',
                value: 0.2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
