import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailImageSlider extends StatelessWidget {
  const ProductDetailImageSlider({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 370,
            ),
          ),
          Positioned(
            top: 10,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // If TAppBar is custom and may use CustomSingleChildLayout, constrain its size:
                SizedBox(
                  width: 48, // adjust as per design
                  height: 48,
                  child: TAppBar(showBackArrow: true),
                ),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: IconButton(
                    icon: const Icon(Iconsax.heart5, color: Colors.red,size: 30,),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
