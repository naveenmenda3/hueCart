import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:huecart/models/user_profile.dart';

class UserService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'users';

  // Create or update user profile
  Future<void> createOrUpdateUser({
    required String userId,
    required String name,
    required String email,
    String? phoneNumber,
    String? address,
  }) async {
    try {
      await _firestore.collection(_collection).doc(userId).set({
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'address': address,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to create/update user: $e');
    }
  }

  // Get user profile
  Future<UserProfile?> getUserProfile(String userId) async {
    try {
      final doc = await _firestore.collection(_collection).doc(userId).get();
      if (doc.exists) {
        return UserProfile.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      print('Error getting user profile: $e');
      return null;
    }
  }

  // Update user profile
  Future<void> updateUserProfile(String userId, Map<String, dynamic> data) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _firestore.collection(_collection).doc(userId).update(data);
    } catch (e) {
      print('Error updating user profile: $e');
      rethrow;
    }
  }

  // Delete user profile
  Future<void> deleteUserProfile(String userId) async {
    try {
      await _firestore.collection(_collection).doc(userId).delete();
    } catch (e) {
      throw Exception('Failed to delete user profile: $e');
    }
  }

  // Stream user profile changes
  Stream<DocumentSnapshot> streamUserProfile(String userId) {
    return _firestore.collection(_collection).doc(userId).snapshots();
  }

  Future<void> createUserProfile(UserProfile profile) async {
    try {
      await _firestore.collection(_collection).doc(profile.id).set(profile.toMap());
    } catch (e) {
      print('Error creating user profile: $e');
      rethrow;
    }
  }
} 