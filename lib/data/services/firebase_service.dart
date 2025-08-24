import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Auth Methods
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Firestore Methods
  Future<void> addProduct(Map<String, dynamic> productData) async {
    try {
      await _firestore.collection('products').add(productData);
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot> getProducts() {
    return _firestore.collection('products').snapshots();
  }

  Future<void> updateProduct(String productId, Map<String, dynamic> productData) async {
    try {
      await _firestore.collection('products').doc(productId).update(productData);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await _firestore.collection('products').doc(productId).delete();
    } catch (e) {
      rethrow;
    }
  }

  // Cart Methods
  Future<void> addToCart(String userId, Map<String, dynamic> cartItem) async {
    try {
      await _firestore.collection('users').doc(userId).collection('cart').add(cartItem);
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot> getCartItems(String userId) {
    return _firestore.collection('users').doc(userId).collection('cart').snapshots();
  }

  Future<void> removeFromCart(String userId, String cartItemId) async {
    try {
      await _firestore.collection('users').doc(userId).collection('cart').doc(cartItemId).delete();
    } catch (e) {
      rethrow;
    }
  }

  // Order Methods
  Future<void> createOrder(String userId, Map<String, dynamic> orderData) async {
    try {
      await _firestore.collection('orders').add({
        ...orderData,
        'userId': userId,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot> getUserOrders(String userId) {
    return _firestore
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // Storage Methods
  Future<String> uploadImage(String path, List<int> imageBytes) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.putData(imageBytes);
      return await ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteImage(String path) async {
    try {
      await _storage.ref().child(path).delete();
    } catch (e) {
      rethrow;
    }
  }
} 