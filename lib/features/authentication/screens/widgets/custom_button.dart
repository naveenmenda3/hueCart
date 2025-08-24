import 'package:flutter/material.dart';
import 'package:huecart/utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onTap,
    this.buttonColor,
    required this.buttonText,
    this.textColor,
    super.key,
  });
  VoidCallback onTap;
  Color? buttonColor;
  Color? textColor;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 295,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: buttonColor ?? AppColors.buttonPrimary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor ?? AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
