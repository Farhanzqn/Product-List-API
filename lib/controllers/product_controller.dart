import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      if (kDebugMode) {
        print('Fetching data...');
      }
      final fetchedProducts = await _apiService.fetchProducts();
      if (kDebugMode) {
        print('Data fetched: $fetchedProducts');
      }
      products.assignAll(fetchedProducts);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      Get.snackbar('Error', 'Failed to fetch products');
    } finally {
      isLoading(false);
    }
  }

}
