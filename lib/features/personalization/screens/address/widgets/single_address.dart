import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      showBorder: true,
      backgroundColor: selectedAddress
          ? AppColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : AppColors.grey,
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? AppColors.dark.withOpacity(0.7) : null,
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Naveen Menda',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '532201 Tekkali k kotturu aitam',
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '+91 7013299540',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ],
      ),
    );
  }
}
