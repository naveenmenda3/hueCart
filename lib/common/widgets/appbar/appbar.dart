import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';
import 'package:huecart/utils/helpers/helper_functions.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return AppBar(
      backgroundColor: dark ? AppColors.primary : AppColors.white,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back),
      )
          : leadingIcon != null
          ? IconButton(
        onPressed: leadingOnPressed,
        icon: Icon(leadingIcon),
      )
          : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(TSizes.appBarHeight);
}
