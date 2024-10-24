import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  Future<List<Product>> fetchProducts() async {
    try {
      print('Calling API...');
      final response =
          await http.get(Uri.parse('https://reqres.in/api/unknown'));

      print('Response status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['data'];
        print('Data received: $data');
        return data.map((product) => Product.fromJson(product)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw e;
    }
  }
}
