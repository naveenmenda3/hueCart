import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/images/circular_image.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.onPressed,
    required this.userName,
    required this.userEmail,
  });
  final VoidCallback onPressed;
  final String userName;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularImage(
        image: NImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        userName,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      subtitle: Text(
        userEmail,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
      ),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: AppColors.white,
          )),
    );
  }
}
