import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? uid;
  final String? email;
  final String? displayName;
  final String? phoneNumber;
  final bool? emailVerified;
  final String? photoURL;
  final Map<String, dynamic>? metadata;

  UserModel({
    this.uid,
    this.email,
    this.displayName,
    this.phoneNumber,
    this.emailVerified,
    this.photoURL,
    this.metadata,
  });

  static UserModel? fromFirebaseUser(User? firebaseUser) {
    if (firebaseUser == null) {
      print('Warning: FirebaseUser is null');
      return null;
    }
    
    try {
      final model = UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email,
        displayName: firebaseUser.displayName,
        phoneNumber: firebaseUser.phoneNumber,
        emailVerified: firebaseUser.emailVerified,
        photoURL: firebaseUser.photoURL,
        metadata: {
          'creationTime': firebaseUser.metadata?.creationTime?.toIso8601String(),
          'lastSignInTime': firebaseUser.metadata?.lastSignInTime?.toIso8601String(),
        },
      );
      print('Successfully created UserModel from FirebaseUser: ${model.uid}');
      return model;
    } catch (e, stackTrace) {
      print('Error creating UserModel from FirebaseUser: $e');
      print('Stack trace: $stackTrace');
      return null;
    }
  }

  static UserModel? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      print('Warning: Map is null');
      return null;
    }
    
    try {
      final model = UserModel(
        uid: map['uid']?.toString(),
        email: map['email']?.toString(),
        displayName: map['displayName']?.toString(),
        phoneNumber: map['phoneNumber']?.toString(),
        emailVerified: map['emailVerified'] as bool?,
        photoURL: map['photoURL']?.toString(),
        metadata: map['metadata'] is Map ? Map<String, dynamic>.from(map['metadata']) : null,
      );
      print('Successfully created UserModel from Map: ${model.uid}');
      return model;
    } catch (e, stackTrace) {
      print('Error creating UserModel from Map: $e');
      print('Stack trace: $stackTrace');
      return null;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'emailVerified': emailVerified,
      'photoURL': photoURL,
      'metadata': metadata,
    };
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, displayName: $displayName)';
  }
} 