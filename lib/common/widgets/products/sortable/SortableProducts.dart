import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/layouts/grid_layout.dart';
import 'package:huecart/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:huecart/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower  Price',
            ' Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(
          height: 32,
        ),
        GridLayout(
            itemCount: 4,
            itemBuilder: (_, index) => ProductCardVertical(
                productId: 'product-$index',  // Provide a unique product ID
                productName: 'Product Name',  // Replace with actual product name
                price: 123.45,               // Replace with actual price
                imageUrl: NImages.product1,   // Replace with actual image URL
            ),
        ),
      ],
    );
  }
}
