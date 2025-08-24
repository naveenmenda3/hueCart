import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add item to cart
  Future<void> addToCart({
    required String userId,
    required String productId,
    required String productName,
    required double price,
    required int quantity,
    required String imageUrl,
  }) async {
    try {
      print('Adding item to cart for user $userId');
      print('Product details: id=$productId, name=$productName, price=$price, quantity=$quantity');
      
      final cartRef = _firestore.collection('users').doc(userId).collection('cart').doc(productId);
      final cartItemDoc = await cartRef.get();
      final now = DateTime.now().toIso8601String();

      if (!cartItemDoc.exists) {
        print('Creating new cart item');
        // Create new cart item
        await cartRef.set({
          'productId': productId,
          'productName': productName,
          'price': price,
          'quantity': quantity,
          'imageUrl': imageUrl,
          'addedAt': now,
          'updatedAt': FieldValue.serverTimestamp(),
        });
        print('New cart item created successfully');
      } else {
        print('Updating existing cart item');
        // Update existing cart item
        final currentQuantity = cartItemDoc.data()?['quantity'] ?? 0;
        final newQuantity = currentQuantity + quantity;
        
        await cartRef.update({
          'quantity': newQuantity,
          'updatedAt': FieldValue.serverTimestamp(),
        });
        print('Cart item updated successfully');
      }
    } catch (e) {
      print('Error in addToCart: $e');
      throw Exception('Failed to add item to cart: $e');
    }
  }

  // Get cart
  Future<QuerySnapshot> getCart(String userId) async {
    try {
      print('Getting cart for user $userId');
      final cartSnapshot = await _firestore.collection('users').doc(userId).collection('cart').get();
      print('Cart items count: ${cartSnapshot.docs.length}');
      return cartSnapshot;
    } catch (e) {
      print('Error in getCart: $e');
      throw Exception('Failed to get cart: $e');
    }
  }

  // Update item quantity
  Future<void> updateItemQuantity(String userId, String productId, int quantity) async {
    try {
      print('Updating quantity for user $userId, product $productId to $quantity');
      final cartRef = _firestore.collection('users').doc(userId).collection('cart').doc(productId);
      
      if (quantity <= 0) {
        // Remove item if quantity is 0 or negative
        await cartRef.delete();
        print('Item removed due to zero quantity');
      } else {
        await cartRef.update({
          'quantity': quantity,
          'updatedAt': FieldValue.serverTimestamp(),
        });
        print('Quantity updated successfully');
      }
    } catch (e) {
      print('Error in updateItemQuantity: $e');
      throw Exception('Failed to update item quantity: $e');
    }
  }

  // Remove item from cart
  Future<void> removeFromCart(String userId, String productId) async {
    try {
      print('Removing item from cart for user $userId, product $productId');
      await _firestore.collection('users').doc(userId).collection('cart').doc(productId).delete();
      print('Item removed successfully');
    } catch (e) {
      print('Error in removeFromCart: $e');
      throw Exception('Failed to remove item from cart: $e');
    }
  }

  // Clear cart
  Future<void> clearCart(String userId) async {
    try {
      print('Clearing cart for user $userId');
      final cartSnapshot = await _firestore.collection('users').doc(userId).collection('cart').get();
      
      // Delete all cart items
      final batch = _firestore.batch();
      for (final doc in cartSnapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
      print('Cart cleared successfully');
    } catch (e) {
      print('Error in clearCart: $e');
      throw Exception('Failed to clear cart: $e');
    }
  }

  // Stream cart changes
  Stream<QuerySnapshot> streamCart(String userId) {
    print('Setting up cart stream for user $userId');
    return _firestore.collection('users').doc(userId).collection('cart').snapshots();
  }
} 