import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:huecart/services/cart_service.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final _cartService = CartService();
  final _auth = FirebaseAuth.instance;

  final RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;
  final RxDouble totalAmount = 0.0.obs;
  final RxBool isLoading = false.obs;
  StreamSubscription<QuerySnapshot>? _cartSubscription;

  @override
  void onInit() {
    super.onInit();
    _initializeCart();
  }

  @override
  void onClose() {
    _cartSubscription?.cancel();
    super.onClose();
  }

  void _initializeCart() {
    final user = _auth.currentUser;
    if (user != null) {
      _listenToCartChanges(user.uid);
    } else {
      cartItems.clear();
      totalAmount.value = 0.0;
    }
  }

  void _listenToCartChanges(String userId) {
    _cartSubscription?.cancel();
    _cartSubscription = _cartService.streamCart(userId).listen(
          (snapshot) {
        final items = snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return {
            ...data,
            'id': doc.id, // Add document ID for reference
          };
        }).toList();
        
        cartItems.value = items;
        _calculateTotal();
      },
      onError: (error) {
        Get.snackbar('Error', 'Failed to load cart: $error', snackPosition: SnackPosition.BOTTOM);
      },
    );
  }

  void _calculateTotal() {
    totalAmount.value = cartItems.fold(
      0.0,
          (sum, item) => sum + ((item['price'] ?? 0.0) * (item['quantity'] ?? 1)),
    );
  }

  Future<void> addToCart({
    required String productId,
    required String productName,
    required double price,
    required int quantity,
    required String imageUrl,
  }) async {
    try {
      isLoading.value = true;
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _cartService.addToCart(
        userId: user.uid,
        productId: productId,
        productName: productName,
        price: price,
        quantity: quantity,
        imageUrl: imageUrl,
      );

      Get.snackbar('Success', 'Item added to cart', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error', 'Failed to add item to cart: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateItemQuantity(String productId, int quantity) async {
    try {
      isLoading.value = true;
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _cartService.updateItemQuantity(user.uid, productId, quantity);
      
      if (quantity <= 0) {
        Get.snackbar('Success', 'Item removed from cart', snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Success', 'Cart updated', snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update cart: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeFromCart(String productId) async {
    try {
      isLoading.value = true;
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _cartService.removeFromCart(user.uid, productId);
      Get.snackbar('Success', 'Item removed from cart', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error', 'Failed to remove item from cart: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> clearCart() async {
    try {
      isLoading.value = true;
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _cartService.clearCart(user.uid);
      Get.snackbar('Success', 'Cart cleared', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error', 'Failed to clear cart: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  int getCartItemCount() {
    return cartItems.fold(0, (sum, item) => sum + ((item['quantity'] ?? 1) as int));
  }

  bool get isCartEmpty => cartItems.isEmpty;
}