import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/sizes.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Gradient Layer
        Container(
          height: 350,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7F00FF), // Deep purple
            Color(0xFFE100FF), // Pink-purple
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withOpacity(0.3),
                blurRadius: 30,
                spreadRadius: 2,
                offset: const Offset(0, 10),
              ),
            ],
          ),
        ),

        // Glassmorphic blur overlay
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(TSizes.cardRadiusLg + 10),
                  bottomRight: Radius.circular(TSizes.cardRadiusLg + 10),
                ),
              ),
            ),
          ),
        ),

        // Top-right glow circle
        Positioned(
          top: -30,
          right: -30,
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Optional Branding Text or Logo
        Positioned(
          top: 50,
          left: TSizes.defaultSpace,
          child: Text(
            'Welcome to Huecart 👋',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // Main content (Search bar, etc.)
        Container(
          padding: EdgeInsets.fromLTRB(
            TSizes.defaultSpace,
            TSizes.defaultSpace * 3.2,
            TSizes.defaultSpace,
            TSizes.defaultSpace,
          ),
          child: child,
        ),
      ],
    );
  }
}
