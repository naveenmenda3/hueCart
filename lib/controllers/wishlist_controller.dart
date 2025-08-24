import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WishlistController extends GetxController {
  final RxList<Map<String, dynamic>> _wishlistItems = <Map<String, dynamic>>[].obs;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> get wishlistItems => _wishlistItems;

  @override
  void onInit() {
    super.onInit();
    loadWishlistFromFirebase();
  }

  Future<void> loadWishlistFromFirebase() async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId != null) {
        final snapshot = await _firestore
            .collection('wishlist')
            .doc(userId)
            .collection('items')
            .get();

        final items = snapshot.docs.map((doc) => doc.data()).toList();
        _wishlistItems.assignAll(items);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load wishlist');
    }
  }

  bool isInWishlist(String productId) {
    return _wishlistItems.any((item) => item['productId'] == productId);
  }

  Future<void> addToWishlist(Map<String, dynamic> product) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId != null && !isInWishlist(product['productId'])) {
        await _firestore
            .collection('wishlist')
            .doc(userId)
            .collection('items')
            .doc(product['productId'])
            .set(product);

        _wishlistItems.add(product);
        Get.snackbar('Added to Wishlist', '${product['name']} has been added to your wishlist');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add item to wishlist');
    }
  }

  Future<void> removeFromWishlist(String productId) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId != null) {
        await _firestore
            .collection('wishlist')
            .doc(userId)
            .collection('items')
            .doc(productId)
            .delete();

        final product = _wishlistItems.firstWhere((item) => item['productId'] == productId, orElse: () => {});
        if (product.isNotEmpty) {
          _wishlistItems.removeWhere((item) => item['productId'] == productId);
          Get.snackbar('Removed from Wishlist', '${product['name']} has been removed from your wishlist');
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to remove item from wishlist');
    }
  }

  Future<void> clearWishlist() async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId != null) {
        final snapshot = await _firestore
            .collection('wishlist')
            .doc(userId)
            .collection('items')
            .get();

        for (var doc in snapshot.docs) {
          await doc.reference.delete();
        }

        _wishlistItems.clear();
        Get.snackbar('Wishlist Cleared', 'All items have been removed from your wishlist');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to clear wishlist');
    }
  }
}