import 'package:flutter/material.dart';
import 'package:invoicer/view/Invoicing/widgets/add_popup.dart';
import 'package:invoicer/view/Invoicing/widgets/custom_table.dart';
import 'package:invoicer/view/Invoicing/widgets/search_field.dart';
import 'package:invoicer/view/components/my_button.dart';
import 'package:invoicer/view_model/invoice_provider.dart';
import 'package:provider/provider.dart';
import 'package:invoicer/utils/snackbar_utils.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController customerAddressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final invoiceProvider = Provider.of<InvoiceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Details'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SearchField(
              hintText: "Customer's name",
              icon: Icons.account_circle_rounded,
              controller: customerNameController,
            ),
            SearchField(
              hintText: "Customer's Address",
              icon: Icons.place,
              controller: customerAddressController,
            ),
            MyButton(
              text: 'Add Item',
              color: Colors.white,
              textColor: Colors.black,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddItemPopup();
                  },
                );
              },
            ),
            const SizedBox(height: 15.0),
            invoiceProvider.products.isEmpty
                ? Container()
                : MyTable(
                    itemCount: invoiceProvider.products.length,
                    product: invoiceProvider.products,
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward_ios),
          onPressed: () {
            if (customerNameController.text.isEmpty ||
                customerAddressController.text.isEmpty) {
              SnackbarUtils.showSnackBar(context, 'Please enter details.');
            } else {
              invoiceProvider.addCustomer(
                  customerNameController.text, customerAddressController.text);
              if (invoiceProvider.products.isEmpty) {
                SnackbarUtils.showSnackBar(
                    context, 'Please add items to proceed.');
              } else {
                invoiceProvider.calculateTotal();
                Navigator.pushNamed(context, '/result');
              }
            }
          }),
    );
  }
}
