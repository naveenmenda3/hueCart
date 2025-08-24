import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/controllers/auth_controller.dart';
import 'package:huecart/features/authentication/screens/password_configuration/forgot_password_screen.dart';
import 'package:huecart/features/authentication/screens/signup/signup.dart';
import 'package:huecart/features/authentication/screens/widgets/custom_button.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/constants/image_strings.dart';
import 'package:huecart/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();
    // Initialize AuthController if not already initialized
    if (!Get.isRegistered<AuthController>()) {
      Get.put(AuthController());
    }
    _authController = Get.find<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //logo , title
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(height: 150, image: AssetImage(NImages.loginimg)),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        TTexts.loginTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!GetUtils.isEmail(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text(TTexts.rememberMe),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => const ForgotPasswordScreen());
                            },
                            child: const Text(TTexts.forgetPassword),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Obx(() => Padding(

                        padding: const EdgeInsets.symmetric(horizontal: 19),
                        child: SizedBox(
                          height: 60,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _authController.isLoading.value
                                    ? null
                                    : () async {
                                        if (_formKey.currentState!.validate()) {
                                          try {
                                            await _authController
                                                .login(
                                              _emailController.text.trim(),
                                              _passwordController.text,
                                            );
                                          } catch (e) {
                                            if (e is FirebaseAuthException) {
                                              // Error is already handled in the controller
                                              return;
                                            }
                                            Get.snackbar(
                                              "Login Failed",
                                              "An unexpected error occurred. Please try again.",
                                              backgroundColor: Colors.red,
                                              colorText: Colors.white,
                                              duration:
                                                  const Duration(seconds: 3),
                                              snackPosition: SnackPosition.BOTTOM,
                                            );
                                          }
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),

                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                ),
                                child: _authController.isLoading.value
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                      )
                                    : const Text(
                                        'Login',
                                        style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                      ),
                              ),
                            ),
                      )),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          onTap: () {
                            Get.to(() => const SignUpScreen());
                          },
                          buttonText: TTexts.createAccount,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Flexible(
                      child: Divider(
                        color: AppColors.grey,
                        thickness: 0.5,
                        indent: 60,
                        endIndent: 5,
                      ),
                    ),
                    Text(
                      TTexts.orSignInWith.capitalize!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const Flexible(
                      child: Divider(
                        color: AppColors.grey,
                        thickness: 0.5,
                        indent: 60,
                        endIndent: 5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.grey,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Image(image: AssetImage(NImages.google)),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.grey,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Image(image: AssetImage(NImages.facebook)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
