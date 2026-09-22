import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String productBaseUrl = 'https://shivaay.us.cc/MiniProject';

  final http.Client client;

  ApiService({http.Client? client}) : client = client ?? http.Client();

  // ==================== PRODUCT API METHODS ==================== //

  // GET: Fetch all products from product_view.php
  Future<List<Product>> fetchProducts() async {
    final url = Uri.parse('$productBaseUrl/product_view.php');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);
      if (data is List) {
        return data.map((json) => Product.fromJson(json)).toList();
      } else if (data is Map<String, dynamic>) {
        if (data.containsKey('data') && data['data'] is List) {
          return (data['data'] as List)
              .map((json) => Product.fromJson(json))
              .toList();
        } else if (data.containsKey('products') && data['products'] is List) {
          return (data['products'] as List)
              .map((json) => Product.fromJson(json))
              .toList();
        }
      }
      return [];
    } else {
      throw Exception('Failed to load products (Status: ${response.statusCode})');
    }
  }

  // POST: Insert product via insert_product.php
  Future<Product> addProduct(Product product) async {
    final url = Uri.parse('$productBaseUrl/insert_product.php');

    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: product.toJson(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        final dynamic data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
            return Product.fromJson(data['data']);
          }
          if (data.containsKey('product') && data['product'] is Map<String, dynamic>) {
            return Product.fromJson(data['product']);
          }
          return Product.fromJson(data);
        }
      } catch (_) {}
      return product;
    } else {
      throw Exception('Failed to add product (Status: ${response.statusCode})');
    }
  }

  // POST: Update product via product_update.php
  Future<Product> updateProduct(Product product) async {
    final url = Uri.parse('$productBaseUrl/product_update.php');

    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: product.toJson(),
    );

    if (response.statusCode == 200) {
      try {
        final dynamic data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
            return Product.fromJson(data['data']);
          }
          return Product.fromJson(data);
        }
      } catch (_) {}
      return product;
    } else {
      throw Exception('Failed to update product (Status: ${response.statusCode})');
    }
  }

  // POST: Delete product via delete_product.php
  Future<void> deleteProduct(String productId) async {
    final url = Uri.parse('$productBaseUrl/delete_product.php');

    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'product_id': productId,
      },
    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete product (Status: ${response.statusCode})');
    }
  }

  // ==================== POST API METHODS ==================== //

}
