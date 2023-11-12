class Product {
  final String product;
  final int quantity;
  final double amount;

  Product({
    required this.product,
    required this.quantity,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'quantity': quantity,
      'amount': amount,
    };
  }
}
