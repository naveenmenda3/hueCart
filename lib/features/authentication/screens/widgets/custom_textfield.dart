import 'package:flutter/material.dart';
import 'package:huecart/utils/constants/colors.dart';

class customTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isObsecureText;
  final String? obscureCharacter;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final VoidCallback? validator;

  const customTextField(
      {super.key,
      required this.controller,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.isObsecureText = false,
      this.obscureCharacter = '*',
      this.hintText,
      this.labelText,
      this.prefixIcon,
      this.borderColor,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObsecureText,
      obscuringCharacter: obscureCharacter!,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 10, left: 25),
        constraints: const BoxConstraints(
          maxHeight: 54,
          maxWidth: 365,
        ),
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.borderPrimary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.borderPrimary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.borderPrimary,
          ),
        ),
      ),
    );
  }
}
