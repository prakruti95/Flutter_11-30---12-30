import '../models/product.dart';
import '../services/api_service.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository({ApiService? apiService})
      : apiService = apiService ?? ApiService();

  Future<List<Product>> getProducts() async {
    return await apiService.fetchProducts();
  }

  Future<Product> addProduct(Product product) async {
    return await apiService.addProduct(product);
  }

  Future<Product> updateProduct(Product product) async {
    return await apiService.updateProduct(product);
  }

  Future<void> deleteProduct(String productId) async {
    await apiService.deleteProduct(productId);
  }
}
