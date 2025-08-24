import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/layouts/BrandCard.dart';
import 'package:huecart/common/widgets/products/sortable/SortableProducts.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Brand Products',
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.white),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Center(
          child: Text('No products yet'),
        ),
      ),
    );
  }
}
