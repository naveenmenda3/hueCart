import 'package:flutter/material.dart';
import 'package:huecart/features/authentication/screens/widgets/custom_button.dart';
import 'package:huecart/utils/constants/text_strings.dart';

class successScreen extends StatelessWidget {
  const successScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});
  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Image(
                  image: AssetImage(image),
                  width: 500,
                  height: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(onTap: onPressed, buttonText: TTexts.tContinue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
