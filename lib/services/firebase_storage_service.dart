import 'dart:typed_data';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload image from bytes
  Future<String> uploadImage(Uint8List imageBytes, String path) async {
    try {
      final ref = _storage.ref().child(path);
      final uploadTask = ref.putData(imageBytes);
      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  // Upload image from file path
  Future<String> uploadImageFromPath(String filePath, String path) async {
    try {
      final ref = _storage.ref().child(path);
      final uploadTask = ref.putFile(File(filePath));
      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  // Delete image
  Future<void> deleteImage(String path) async {
    try {
      await _storage.ref().child(path).delete();
    } catch (e) {
      throw Exception('Failed to delete image: $e');
    }
  }

  // Get download URL
  Future<String> getDownloadURL(String path) async {
    try {
      return await _storage.ref().child(path).getDownloadURL();
    } catch (e) {
      throw Exception('Failed to get download URL: $e');
    }
  }
} 