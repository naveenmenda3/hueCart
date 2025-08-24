import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/icons/circular_icons.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: 24,
          color: AppColors.black,
          backgroundColor: AppColors.light,
          onPressed: onRemove,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          quantity.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: 24,
          color: AppColors.light,
          backgroundColor: AppColors.primary,
          onPressed: onAdd,
        ),
      ],
    );
  }
}
