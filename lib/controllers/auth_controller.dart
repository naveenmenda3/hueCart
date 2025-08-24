import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:huecart/features/authentication/screens/login/login.dart';
import 'package:huecart/navigation_menu.dart';
import 'package:huecart/services/service_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huecart/models/user_model.dart';
// Change this line:
// import 'package:get_utils/get_utils.dart';

// To this:
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  final _authService = ServiceProvider.to.authService;
  final _userService = ServiceProvider.to.userService;

  final RxBool isLoading = false.obs;
  final Rx<User?> user = Rx<User?>(null);
  final errorMessage = RxString('');
  final Rx<Map<String, dynamic>> userProfile = Rx<Map<String, dynamic>>({});
  final Rx<UserModel?> userModel = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    user.value = _auth.currentUser;
    if (user.value != null) {
      fetchUserProfile();
      try {
        final userDetails = UserModel.fromFirebaseUser(user.value);
        if (userDetails == null) {
          print('Warning: Failed to create UserModel from user');
          userModel.value = null;
          return;
        }
        userModel.value = userDetails;
      } catch (e) {
        print('Error converting FirebaseUser to UserModel: $e');
        userModel.value = null;
      }
    }
  }

  Future<void> fetchUserProfile() async {
    try {
      isLoading.value = true;
      final doc = await _db.collection('users').doc(user.value?.uid).get();
      if (doc.exists) {
        userProfile.value = doc.data() ?? {};
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch profile: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(
      String email, String password, String firstName, String lastName) async {
    try {
      isLoading.value = true;
      print('Starting registration process for email: $email');
      
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('Firebase user created successfully: ${userCredential.user?.uid}');

      if (userCredential.user == null) {
        print('Error: User credential is null after registration');
        Get.snackbar('Error', 'Registration failed: User creation failed');
        return;
      }

      try {
        await _db.collection('users').doc(userCredential.user!.uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
        print('User document created in Firestore successfully');

        user.value = userCredential.user;
        
        try {
          final userDetails = UserModel.fromFirebaseUser(userCredential.user);
          if (userDetails == null) {
            print('Warning: Failed to create UserModel from Firebase user');
            Get.snackbar('Warning', 'User created but failed to get user details');
          } else {
            userModel.value = userDetails;
            print('UserModel created successfully');
          }
        } catch (e, stackTrace) {
          print('Error creating UserModel: $e');
          print('Stack trace: $stackTrace');
          Get.snackbar('Warning', 'User created but failed to get user details');
        }

        await fetchUserProfile();
        Get.to(() => LoginScreen());
      } catch (e) {
        print('Error creating user document in Firestore: $e');
        // Try to delete the Firebase user if Firestore document creation fails
        try {
          await userCredential.user?.delete();
          print('Deleted Firebase user after Firestore document creation failure');
        } catch (deleteError) {
          print('Error deleting Firebase user: $deleteError');
        }
        rethrow;
      }
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException during registration: ${e.code} - ${e.message}');
      String message;
      switch (e.code) {
        case 'email-already-in-use':
          message = 'This email is already registered.';
          break;
        case 'invalid-email':
          message = 'The email address is invalid.';
          break;
        case 'operation-not-allowed':
          message = 'Email/password accounts are not enabled.';
          break;
        case 'weak-password':
          message = 'The password is too weak.';
          break;
        default:
          message = 'An error occurred during registration.';
      }
      Get.snackbar('Registration Failed', message);
    } catch (e, stackTrace) {
      print('Registration error: $e');
      print('Stack trace: $stackTrace');
      Get.snackbar('Error', 'Registration failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      print('Attempting to login with email: $email');
      
      // Validate email format
      if (!GetUtils.isEmail(email)) {
        Get.snackbar(
          'Invalid Email',
          'Please enter a valid email address',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Validate password
      if (password.isEmpty || password.length < 6) {
        Get.snackbar(
          'Invalid Password',
          'Password must be at least 6 characters',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      
      // Attempt to sign in
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (result.user != null) {
        print('Firebase authentication successful for user: ${result.user?.uid}');
        user.value = result.user;
        
        try {
          // Create UserModel directly from Firebase User
          final userDetails = UserModel.fromFirebaseUser(result.user);
          if (userDetails != null) {
            print('Successfully created UserModel: ${userDetails.toString()}');
            userModel.value = userDetails;
            await fetchUserProfile();
            Get.offAll(() => NavigationMenu());
          } else {
            print('Warning: Failed to create UserModel from Firebase User');
            Get.snackbar(
              'Error',
              'Failed to get user details. Please try again.',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        } catch (e, stackTrace) {
          print('Error getting user details: $e');
          print('Stack trace: $stackTrace');
          Get.snackbar(
            'Error',
            'Failed to get user details. Please try again.',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        print('Warning: Firebase authentication succeeded but user is null');
        Get.snackbar(
          'Error',
          'Sign in failed. No user found.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException during login: ${e.code} - ${e.message}');
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found with this email. Please check your email or sign up.';
          break;
        case 'wrong-password':
          message = 'Incorrect password. Please try again or use forgot password.';
          break;
        case 'invalid-email':
          message = 'The email address is invalid.';
          break;
        case 'user-disabled':
          message = 'This user account has been disabled. Please contact support.';
          break;
        case 'too-many-requests':
          message = 'Too many attempts. Please try again later or reset your password.';
          break;
        case 'invalid-credential':
          message = 'Invalid credentials. Please check your email and password.';
          break;
        default:
          message = 'An error occurred during sign in: ${e.message}';
      }
      Get.snackbar(
        'Login Failed',
        message,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
    } catch (e, stackTrace) {
      print('Login error: $e');
      print('Stack trace: $stackTrace');
      Get.snackbar(
        'Login Failed',
        'An unexpected error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      user.value = null;
      userProfile.value = {};
      userModel.value = null;
      Get.to(() => const LoginScreen());
    } catch (e) {
      Get.snackbar('Error', 'Sign out failed: $e');
    }
  }

  Future<void> updateProfile(Map<String, dynamic> data) async {
    try {
      isLoading.value = true;
      await _db.collection('users').doc(user.value?.uid).update({
        ...data,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      await fetchUserProfile();
      Get.snackbar('Success', 'Profile updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updatePassword(String newPassword) async {
    try {
      isLoading.value = true;
      await user.value?.updatePassword(newPassword);
      Get.snackbar('Success', 'Password updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update password: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteAccount() async {
    try {
      isLoading.value = true;
      await _db.collection('users').doc(user.value?.uid).delete();
      await user.value?.delete();
      user.value = null;
      userProfile.value = {};
      userModel.value = null;
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete account: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      isLoading.value = true;
      await _authService.resetPassword(email);
      Get.snackbar(
        'Success',
        'Password reset email sent. Please check your inbox.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found with this email.';
          break;
        case 'invalid-email':
          message = 'The email address is invalid.';
          break;
        default:
          message = 'An error occurred. Please try again.';
      }
      Get.snackbar(
        'Error',
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
