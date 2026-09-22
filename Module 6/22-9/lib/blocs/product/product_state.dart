import 'package:equatable/equatable.dart';
import '../../models/product.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  const ProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductOperationSuccess extends ProductState {
  final String message;
  final List<Product> products;

  const ProductOperationSuccess({
    required this.message,
    required this.products,
  });

  @override
  List<Object?> get props => [message, products];
}

class ProductError extends ProductState {
  final String message;
  final List<Product> products;

  const ProductError({
    required this.message,
    this.products = const [],
  });

  @override
  List<Object?> get props => [message, products];
}
