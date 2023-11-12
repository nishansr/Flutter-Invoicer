import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invoicer/view/components/my_button.dart';
import 'package:invoicer/view/result/widgets/bill.dart';
import 'package:invoicer/view/result/widgets/bill_header.dart';
import 'package:invoicer/view_model/invoice_provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invoiceProvider = Provider.of<InvoiceProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              BillHeader(
                name: invoiceProvider.customer.name,
                address: invoiceProvider.customer.address,
                date: DateTime.now(),
              ),
              Bill(
                itemCount: invoiceProvider.products.length,
                product: invoiceProvider.products,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Total'),
                    const SizedBox(width: 45.0),
                    Text('Rs. ${invoiceProvider.sum}'),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              const Divider(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyButton(
        text: 'Done',
        textColor: Colors.white,
        color: Colors.black,
        onTap: () {
          invoiceProvider.generateJsonFile(
            invoiceProvider.customer.name,
            invoiceProvider.products,
          );

          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }
}
