import 'package:flutter/material.dart';
import '../../models/product.dart';

class AddProductDialog extends StatefulWidget {
  final Product? product;

  const AddProductDialog({super.key, this.product});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _discountedPriceController;
  late TextEditingController _quantityController;
  late TextEditingController _ratingsController;
  late TextEditingController _featuresController;
  late TextEditingController _imageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.productName ?? '');
    _priceController = TextEditingController(text: widget.product?.productPrice ?? '');
    _discountedPriceController =
        TextEditingController(text: widget.product?.finalDiscountedPrice ?? '');
    _quantityController = TextEditingController(text: widget.product?.quantity ?? '1');
    _ratingsController = TextEditingController(text: widget.product?.ratings ?? '5');
    _featuresController = TextEditingController(text: widget.product?.features ?? '');
    _imageController = TextEditingController(text: widget.product?.productImage ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _discountedPriceController.dispose();
    _quantityController.dispose();
    _ratingsController.dispose();
    _featuresController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        productId: widget.product?.productId,
        productName: _nameController.text.trim(),
        productPrice: _priceController.text.trim(),
        finalDiscountedPrice: _discountedPriceController.text.trim(),
        quantity: _quantityController.text.trim(),
        ratings: _ratingsController.text.trim(),
        features: _featuresController.text.trim(),
        productImage: _imageController.text.trim(),
      );
      Navigator.of(context).pop(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.product != null;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(isEditing ? 'Update Product' : 'Add New Product'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Product Name (product_name)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Enter product name' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Product Price (product_price)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Enter price' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _discountedPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Discounted Price (final_discounted_price)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Enter discounted price' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _quantityController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Quantity',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == null || value.trim().isEmpty ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _ratingsController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Ratings',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == null || value.trim().isEmpty ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _featuresController,
                decoration: const InputDecoration(
                  labelText: 'Features (features)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Enter features' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(
                  labelText: 'Image URL (product_image)',
                  border: OutlineInputBorder(),
                  hintText: 'https://...',
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text(isEditing ? 'Update Product' : 'Add Product'),
        ),
      ],
    );
  }
}
