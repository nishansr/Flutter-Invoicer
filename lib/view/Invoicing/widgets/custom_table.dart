import 'package:flutter/material.dart';
import 'package:invoicer/view_model/invoice_provider.dart';
import 'package:provider/provider.dart';

class MyTable extends StatelessWidget {
  final int itemCount;
  final List product;

  const MyTable({
    Key? key,
    required this.itemCount,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<InvoiceProvider>(
        builder: (context, invoiceProvider, child) => Table(
          border: TableBorder.all(color: Colors.white),
          columnWidths: const {
            0: FractionColumnWidth(0.1),
            1: FractionColumnWidth(0.3),
            2: FractionColumnWidth(0.25),
            3: FractionColumnWidth(0.3),
          },
          children: [
            TableRow(
              children: <Widget>[
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('SN'),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Product'),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Center(child: Text('Qty.')),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Amount'),
                  ),
                ),
              ],
            ),
            ...List.generate(
              itemCount,
              (index) => TableRow(children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      (index + 1).toString(),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(product[index].product),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // InkWell(
                        //     onTap: () {
                        //       invoiceProvider.incrementQuantity(index);
                        //     },
                        //     child: const Icon(Icons.arrow_drop_down_outlined)),
                        Text(
                          product[index].quantity.toString(),
                        ),
                        // InkWell(
                        //     onTap: () {
                        //       invoiceProvider.incrementQuantity(index);
                        //     },
                        //     child: const Icon(Icons.arrow_drop_up_outlined)),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text((product[index].amount * product[index].quantity)
                            .toString()),
                        InkWell(
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onTap: () {
                              invoiceProvider.deleteProduct(index);
                            })
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
