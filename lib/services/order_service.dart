import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OrderService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'orders';

  // Create new order
  Future<String> createOrder({
    required String userId,
    required List<Map<String, dynamic>> items,
    required double totalAmount,
    required String shippingAddress,
    required String paymentMethod,
    String? notes,
  }) async {
    try {
      final orderRef = await _firestore.collection(_collection).add({
        'userId': userId,
        'items': items,
        'totalAmount': totalAmount,
        'shippingAddress': shippingAddress,
        'paymentMethod': paymentMethod,
        'notes': notes,
        'status': 'pending',
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return orderRef.id;
    } catch (e) {
      throw Exception('Failed to create order: $e');
    }
  }

  // Get order by ID
  Future<DocumentSnapshot> getOrderById(String orderId) async {
    try {
      return await _firestore.collection(_collection).doc(orderId).get();
    } catch (e) {
      throw Exception('Failed to get order: $e');
    }
  }

  // Get user orders
  Future<QuerySnapshot> getUserOrders(String userId) async {
    try {
      return await _firestore
          .collection(_collection)
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .get();
    } catch (e) {
      throw Exception('Failed to get user orders: $e');
    }
  }

  // Update order status
  Future<void> updateOrderStatus(String orderId, String status) async {
    try {
      await _firestore.collection(_collection).doc(orderId).update({
        'status': status,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update order status: $e');
    }
  }

  // Cancel order
  Future<void> cancelOrder(String orderId) async {
    try {
      await _firestore.collection(_collection).doc(orderId).update({
        'status': 'cancelled',
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to cancel order: $e');
    }
  }

  // Get all orders (for admin)
  Future<QuerySnapshot> getAllOrders() async {
    try {
      return await _firestore
          .collection(_collection)
          .orderBy('createdAt', descending: true)
          .get();
    } catch (e) {
      throw Exception('Failed to get all orders: $e');
    }
  }

  // Stream user orders
  Stream<QuerySnapshot> streamUserOrders(String userId) {
    return _firestore
        .collection(_collection)
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // Stream all orders (for admin)
  Stream<QuerySnapshot> streamAllOrders() {
    return _firestore
        .collection(_collection)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
} 