import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product.dart';
import '../../repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<FetchProductsEvent>(_onFetchProducts);
    on<AddProductEvent>(_onAddProduct);
    on<UpdateProductEvent>(_onUpdateProduct);
    on<DeleteProductEvent>(_onDeleteProduct);
  }

  Future<void> _onFetchProducts(
    FetchProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final products = await productRepository.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  Future<void> _onAddProduct(
    AddProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    final currentProducts = _getCurrentProducts();
    try {
      final newProduct = await productRepository.addProduct(event.product);
      final updatedProducts = [newProduct, ...currentProducts];
      emit(ProductOperationSuccess(
        message: 'Product added successfully!',
        products: updatedProducts,
      ));
    } catch (e) {
      emit(ProductError(
        message: 'Failed to add product: ${e.toString()}',
        products: currentProducts,
      ));
    }
  }

  Future<void> _onUpdateProduct(
    UpdateProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    final currentProducts = _getCurrentProducts();
    try {
      final updatedProduct = await productRepository.updateProduct(event.product);
      final updatedProducts = currentProducts.map((p) {
        return p.productId == updatedProduct.productId ? updatedProduct : p;
      }).toList();

      emit(ProductOperationSuccess(
        message: 'Product updated successfully!',
        products: updatedProducts,
      ));
    } catch (e) {
      emit(ProductError(
        message: 'Failed to update product: ${e.toString()}',
        products: currentProducts,
      ));
    }
  }

  Future<void> _onDeleteProduct(
    DeleteProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    final currentProducts = _getCurrentProducts();
    try {
      await productRepository.deleteProduct(event.productId);
      final updatedProducts =
          currentProducts.where((p) => p.productId != event.productId).toList();

      emit(ProductOperationSuccess(
        message: 'Product deleted successfully!',
        products: updatedProducts,
      ));
    } catch (e) {
      emit(ProductError(
        message: 'Failed to delete product: ${e.toString()}',
        products: currentProducts,
      ));
    }
  }

  List<Product> _getCurrentProducts() {
    if (state is ProductLoaded) {
      return (state as ProductLoaded).products;
    } else if (state is ProductOperationSuccess) {
      return (state as ProductOperationSuccess).products;
    } else if (state is ProductError) {
      return (state as ProductError).products;
    }
    return [];
  }
}
