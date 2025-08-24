import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'products';

  // Add a new product
  Future<void> addProduct({
    required String name,
    required String description,
    required double price,
    required String category,
    required List<String> images,
    required int stock,
    Map<String, dynamic>? attributes,
  }) async {
    try {
      await _firestore.collection(_collection).add({
        'name': name,
        'description': description,
        'price': price,
        'category': category,
        'images': images,
        'stock': stock,
        'attributes': attributes ?? {},
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add product: $e');
    }
  }

  // Get all products
  Future<QuerySnapshot> getAllProducts() async {
    try {
      return await _firestore.collection(_collection).get();
    } catch (e) {
      throw Exception('Failed to get products: $e');
    }
  }

  // Get products by category
  Future<QuerySnapshot> getProductsByCategory(String category) async {
    try {
      return await _firestore
          .collection(_collection)
          .where('category', isEqualTo: category)
          .get();
    } catch (e) {
      throw Exception('Failed to get products by category: $e');
    }
  }

  // Get product by ID
  Future<DocumentSnapshot> getProductById(String productId) async {
    try {
      return await _firestore.collection(_collection).doc(productId).get();
    } catch (e) {
      throw Exception('Failed to get product: $e');
    }
  }

  // Update product
  Future<void> updateProduct(
      String productId, Map<String, dynamic> data) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _firestore.collection(_collection).doc(productId).update(data);
    } catch (e) {
      throw Exception('Failed to update product: $e');
    }
  }

  // Delete product
  Future<void> deleteProduct(String productId) async {
    try {
      await _firestore.collection(_collection).doc(productId).delete();
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }

  // Stream all products
  Stream<QuerySnapshot> streamProducts() {
    return _firestore.collection(_collection).snapshots();
  }

  // Search products
  Future<QuerySnapshot> searchProducts(String query) async {
    try {
      return await _firestore
          .collection(_collection)
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf8ff')
          .get();
    } catch (e) {
      throw Exception('Failed to search products: $e');
    }
  }
}
