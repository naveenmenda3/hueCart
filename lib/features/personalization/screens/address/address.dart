import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/features/personalization/screens/address/add_new_address.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Addresses'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(
                title: 'Saved Addresses',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              AddressCard(
                dark: dark,
                name: 'John Doe',
                phoneNumber: '+1 234 567 890',
                selectedAddress: true,
                onTap: () {},
              ),
              AddressCard(
                dark: dark,
                name: 'Jane Smith',
                phoneNumber: '+1 234 567 890',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const AddNewAddressScreen()),
            child: const Text('Add new Address'),
          ),
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.dark,
    required this.name,
    required this.phoneNumber,
    this.selectedAddress = false,
    this.onTap,
  });

  final bool dark;
  final String name;
  final String phoneNumber;
  final bool selectedAddress;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: selectedAddress
              ? AppColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: Border.all(
            color: selectedAddress
                ? AppColors.primary
                : AppColors.grey,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 5,
              top: 0,
              child: Icon(
                selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? dark
                        ? AppColors.light
                        : AppColors.dark
                    : null,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: TSizes.sm / 2),
                Row(
                  children: [
                    const Icon(Iconsax.call, size: 16),
                    const SizedBox(width: TSizes.sm),
                    Text(phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
                const SizedBox(height: TSizes.sm / 2),
                const Row(
                  children: [
                    Icon(Iconsax.location, size: 16),
                    SizedBox(width: TSizes.sm),
                    Expanded(
                      child: Text(
                        '82356 Timmy Coves, South Liana, Maine, 87665, USA',
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
