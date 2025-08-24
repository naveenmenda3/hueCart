import 'package:flutter/material.dart';
import 'package:huecart/utils/constants/colors.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
            flex: 11,
            child: SizedBox(
              child: LinearProgressIndicator(
                value: value,
                minHeight: 11,
                backgroundColor: AppColors.grey,
                borderRadius: BorderRadius.circular(7),
                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
              ),
            )),
      ],
    );
  }
}
