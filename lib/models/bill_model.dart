import 'package:invoicer/models/cutomer_model.dart';
import 'package:invoicer/models/product_model.dart';

class BillData {
  final Customer customer;
  final DateTime date;
  final List<Product> items;
  final double sum;

  BillData({
    required this.customer,
    required this.date,
    required this.items,
    required this.sum,
  });

  Map<String, dynamic> toJson() {
    return {
      'customer': customer.toJson(),
      'date': date.toIso8601String(),
      'items': items.map((item) => item.toJson()).toList(),
      'sum' : sum,
    };
  }
}
