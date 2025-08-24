import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/products/sortable/SortableProducts.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text(
          'Popular Products',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SortableProducts(),
        ),
      ),
    );
  }
}
