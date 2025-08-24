import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:huecart/models/user_model.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rx<User?> currentUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    currentUser.value = _auth.currentUser;
    _auth.authStateChanges().listen((User? user) {
      currentUser.value = user;
    });
  }

  // Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      print('Attempting to sign in with email: $email');
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        return userCredential;
      }

      throw Exception('User credential is null after sign in');
    } catch (e) {
      print('Sign in error details: $e');
      throw Exception('Failed to sign in: $e');
    }
  }

  // Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Failed to send password reset email: $e');
    }
  }

  // Get current Firebase user
  User? get user => _auth.currentUser;

  bool get isLoggedIn => user != null;

  // Get user details from FirebaseUser directly
  UserModel? getUserDetailsFromFirebase() {
    final current = _auth.currentUser;
    if (current == null) {
      print('Warning: No current user found');
      return null;
    }

    try {
      final userDetails = UserModel.fromFirebaseUser(current);
      if (userDetails == null) {
        print('Warning: Failed to create UserModel from current user');
        return null;
      }
      return userDetails;
    } catch (e) {
      print('Error creating UserModel: $e');
      return null;
    }
  }
}
