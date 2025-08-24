import 'package:flutter/material.dart';
import 'package:huecart/utils/constants/colors.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.trailing,
      this.onTap});

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
        color: AppColors.primary,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w600, color: AppColors.black, fontSize: 17),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
            fontSize: 14),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
