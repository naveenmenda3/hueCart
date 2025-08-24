import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  // Observable list of categories
  final RxList<Map<String, dynamic>> categories = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // Fetch all categories
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final snapshot = await _db.collection('categories').get();
      categories.value = snapshot.docs.map((doc) => {
        'id': doc.id,
        ...doc.data(),
      }).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch categories: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Add a new category
  Future<void> addCategory(Map<String, dynamic> categoryData) async {
    try {
      isLoading.value = true;
      await _db.collection('categories').add(categoryData);
      await fetchCategories(); // Refresh the list
      Get.snackbar('Success', 'Category added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add category: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Update a category
  Future<void> updateCategory(String id, Map<String, dynamic> categoryData) async {
    try {
      isLoading.value = true;
      await _db.collection('categories').doc(id).update(categoryData);
      await fetchCategories(); // Refresh the list
      Get.snackbar('Success', 'Category updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update category: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Delete a category
  Future<void> deleteCategory(String id) async {
    try {
      isLoading.value = true;
      await _db.collection('categories').doc(id).delete();
      await fetchCategories(); // Refresh the list
      Get.snackbar('Success', 'Category deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete category: $e');
    } finally {
      isLoading.value = false;
    }
  }
} 