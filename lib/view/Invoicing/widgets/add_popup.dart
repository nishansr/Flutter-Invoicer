import 'package:flutter/material.dart';
import 'package:invoicer/utils/snackbar_utils.dart';
import 'package:invoicer/view/Invoicing/widgets/search_field.dart';
import 'package:invoicer/view_model/invoice_provider.dart';
import 'package:provider/provider.dart';

class AddItemPopup extends StatefulWidget {
  @override
  _AddItemPopupState createState() => _AddItemPopupState();
}

class _AddItemPopupState extends State<AddItemPopup> {
  final TextEditingController productController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final invoiceProvider = Provider.of<InvoiceProvider>(context);

    return AlertDialog(
      title: const Text('Add Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchField(
            hintText: 'Product',
            icon: Icons.category_sharp,
            controller: productController,
          ),
          const SizedBox(height: 10),
          SearchField(
            hintText: 'Quantity',
            icon: Icons.production_quantity_limits_outlined,
            controller: quantityController,
            type: TextInputType.number,
          ),
          const SizedBox(height: 10),
          SearchField(
            hintText: 'Price',
            icon: Icons.attach_money_sharp,
            controller: priceController,
            type: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            String product = productController.text;
            String quantity = quantityController.text;
            String price = priceController.text;

            if (product.isEmpty || price.isEmpty || quantity.isEmpty) {
              SnackbarUtils.showSnackBar(context, 'Please enter all details');
            } else {
              invoiceProvider.addToList(product, quantity, price);
            }
            Navigator.pop(context);
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
