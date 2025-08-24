import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/appbar/appbar.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:huecart/common/widgets/listtiles/settingsmenu.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';
import 'package:huecart/features/authentication/screens/widgets/custom_button.dart';
import 'package:huecart/features/personalization/screens/address/address.dart';
import 'package:huecart/features/personalization/screens/profile/profile.dart';
import 'package:huecart/features/shop/screens/cart/cart.dart';
import 'package:huecart/features/shop/screens/orders/orders.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
// Add at the top with other imports
import 'package:huecart/utils/constants/image_strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                  SizedBox(height: 10,),
                  TAppBar(
                    title: Padding(
                      padding: const EdgeInsets.only(left: 20.0,bottom: 20),
                      child: Text(
                        'Account',
                        style: Theme.of(context).textTheme.headlineMedium!.apply(color:dark? AppColors.white : AppColors.dark),
                      ),
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
                      onPressed: () => Get.to(() => const ProfileScreen()),
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
                  const TSectionHeading(title: "Account Settings"),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                    onTap: () {
                      Get.to(CartScreen());
                    },
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(() => const OrdersScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: "App Settings"),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to your Cloud Firebase',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      buttonText: "Logout",
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return ListTile(
      leading: Icon(icon, size: 28, color: dark? AppColors.white : AppColors.dark,),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
