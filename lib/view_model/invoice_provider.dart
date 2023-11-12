import 'dart:convert';
import 'dart:io';
import 'package:invoicer/models/cutomer_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:invoicer/models/bill_model.dart';
import 'package:invoicer/models/product_model.dart';

class InvoiceProvider extends ChangeNotifier {
  List<Product> _products = [];
  double _sum = 0.0;
  Customer _customer = Customer(name: 'name', address: 'address');

  List<Product> get products => _products;
  double get sum => _sum;
  Customer get customer => _customer;

  void addToList(String product, String quantity, String price) {
    _products.add(
      Product(
        product: product,
        quantity: int.parse(quantity),
        amount: double.parse(price),
      ),
    );
    notifyListeners();
  }

  void incrementQuantity(int index) {
    _products[index].quantity + 1;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    _products[index].quantity - 1;
    notifyListeners();
  }

  void addCustomer(String name, String address) {
    _customer = Customer(name: name, address: address);
    notifyListeners();
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }

  void calculateTotal() {
    for (var i in _products) {
      _sum += (i.amount * i.quantity);
    }
    notifyListeners();
  }

  void generateJsonFile(String filename, List<Product> billItems) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$filename.json';

    final BillData billData = BillData(
      customer: _customer,
      date: DateTime.now(),
      items: billItems,
      sum: _sum,
    );

    final Map<String, dynamic> jsonBill = billData.toJson();

    final File file = File(filePath);
    file.writeAsStringSync(jsonEncode(jsonBill));

    debugPrint('JSON file (${filename}.json) generated successfully: ${file.path}');

    debugPrint(jsonEncode(jsonBill));

    _products = [];
    _sum = 0;
    notifyListeners();
  }
}
