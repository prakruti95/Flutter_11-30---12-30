import 'package:flutter/material.dart';
import '../models/bill_model.dart';
import '../services/pdf_service.dart';

class BillFormScreen extends StatefulWidget
{
  const BillFormScreen({super.key});

  @override
  State<BillFormScreen> createState() => _BillFormScreenState();
}

class _BillFormScreenState extends State<BillFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final List<ItemController> _itemControllers = [];

  @override
  void initState() {
    super.initState();
    _addItem(); // Start with one item
  }

  void _addItem() {
    setState(() {
      _itemControllers.add(ItemController());
    });
  }

  void _removeItem(int index) {
    setState(() {
      _itemControllers.removeAt(index);
    });
  }

  void _generatePdf() {
    if (_formKey.currentState!.validate()) {
      final items = _itemControllers.map((c) => BillItem(
        description: c.descController.text,
        quantity: double.tryParse(c.qtyController.text) ?? 0,
        unitPrice: double.tryParse(c.priceController.text) ?? 0,
      )).toList();

      final bill = Bill(
        customerName: _nameController.text,
        customerAddress: _addressController.text,
        date: DateTime.now(),
        items: items,
      );
      
      PdfService.generateAndSavePdf(bill);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Industry Bill Generator')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Customer Info', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Customer Name'),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Customer Address'),
                maxLines: 2,
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 30),
              const Text('Bill Items', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Divider(),
              ..._itemControllers.asMap().entries.map((entry) {
                int index = entry.key;
                ItemController controller = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: controller.descController,
                          decoration: const InputDecoration(labelText: 'Item Description', border: OutlineInputBorder()),
                          validator: (val) => val!.isEmpty ? 'Required' : null,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: controller.qtyController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Qty', border: OutlineInputBorder()),
                          validator: (val) => val!.isEmpty ? '?' : null,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: controller.priceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Price', border: OutlineInputBorder()),
                          validator: (val) => val!.isEmpty ? '?' : null,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeItem(index),
                      )
                    ],
                  ),
                );
              }).toList(),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: _addItem,
                icon: const Icon(Icons.add),
                label: const Text('Add More Items'),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
                  onPressed: _generatePdf,
                  child: const Text('GENERATE PDF & SAVE', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemController {
  final descController = TextEditingController();
  final qtyController = TextEditingController(text: '1');
  final priceController = TextEditingController();
}
