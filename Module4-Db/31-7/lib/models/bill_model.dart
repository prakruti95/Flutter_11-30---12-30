class BillItem {
  final String description;
  final double quantity;
  final double unitPrice;

  BillItem({
    required this.description,
    required this.quantity,
    required this.unitPrice,
  });

  double get total => quantity * unitPrice;
}

class Bill {
  final String customerName;
  final String customerAddress;
  final DateTime date;
  final List<BillItem> items;

  Bill({
    required this.customerName,
    required this.customerAddress,
    required this.date,
    required this.items,
  });

  double get totalAmount => items.fold(0, (sum, item) => sum + item.total);
}
