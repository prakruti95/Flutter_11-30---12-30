import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? productId;
  final String productName;
  final String productPrice;
  final String productImage;
  final String finalDiscountedPrice;
  final String features;
  final String ratings;
  final String quantity;

  const Product({
    this.productId,
    required this.productName,
    required this.productPrice,
    this.productImage = '',
    required this.finalDiscountedPrice,
    required this.features,
    this.ratings = '0',
    this.quantity = '1',
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id']?.toString(),
      productName: json['product_name']?.toString() ?? '',
      productPrice: json['product_price']?.toString() ?? '0',
      productImage: json['product_image']?.toString() ?? '',
      finalDiscountedPrice: json['final_discounted_price']?.toString() ?? '0',
      features: json['features']?.toString() ?? '',
      ratings: json['ratings']?.toString() ?? '0',
      quantity: json['quantity']?.toString() ?? '0',
    );
  }

  Map<String, String> toJson() {
    final map = <String, String>{
      'product_name': productName,
      'product_price': productPrice,
      'product_image': productImage,
      'final_discounted_price': finalDiscountedPrice,
      'features': features,
      'ratings': ratings,
      'quantity': quantity,
    };
    if (productId != null) {
      map['product_id'] = productId!;
    }
    return map;
  }

  Product copyWith({
    String? productId,
    String? productName,
    String? productPrice,
    String? productImage,
    String? finalDiscountedPrice,
    String? features,
    String? ratings,
    String? quantity,
  }) {
    return Product(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      productImage: productImage ?? this.productImage,
      finalDiscountedPrice: finalDiscountedPrice ?? this.finalDiscountedPrice,
      features: features ?? this.features,
      ratings: ratings ?? this.ratings,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
        productId,
        productName,
        productPrice,
        productImage,
        finalDiscountedPrice,
        features,
        ratings,
        quantity,
      ];
}
