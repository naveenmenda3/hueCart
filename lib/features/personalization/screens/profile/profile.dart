import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:huecart/common/widgets/listtiles/profile_menu.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/features/personalization/screens/address/address.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/image_strings.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: dark? AppColors.white: AppColors.dark),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  ListTile(
                    leading: const CircleAvatar(
                      maxRadius: 50,
                      
                      backgroundImage: AssetImage(NImages.users),
                    ),
                    title: Text(
                      'Naveen Menda',
                      style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.white),
                    ),
                    subtitle: Text(
                      'mendanaveenkumar@gmail.com',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.white.withOpacity(0.8)),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.edit, color: AppColors.white),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TSectionHeading(title: 'Account Information'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ProfileMenu(
                    onPressed: () {},
                    title: 'My Name',
                    value: 'Naveen Menda',
                  ),
                  ProfileMenu(
                    onPressed: () {},
                    title: 'User ID',
                    value: '45689',
                  ),
                  ProfileMenu(
                    onPressed: () {},
                    title: 'E-mail',
                    value: 'mendanaveenkumar@gmail.com',
                  ),
                  ProfileMenu(
                    onPressed: () {},
                    title: 'Phone Number',
                    value: '+91 9876543210',
                  ),
                  ProfileMenu(
                    onPressed: () {},
                    title: 'Gender',
                    value: 'Male',
                  ),
                  ProfileMenu(
                    onPressed: () {},
                    title: 'Date of Birth',
                    value: '10 Oct, 1994',
                  ),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Center(
                    child: TextButton(
                      onPressed: () => Get.to(() => const UserAddressScreen()),
                      child: const Text('Change Address'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
