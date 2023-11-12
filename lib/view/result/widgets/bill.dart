import 'package:flutter/material.dart';

class Bill extends StatelessWidget {
  final int itemCount;
  final List product;

  const Bill({
    Key? key,
    required this.itemCount,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        border: TableBorder.all(color: Colors.white),
        columnWidths: const {
          0: FractionColumnWidth(0.1),
          1: FractionColumnWidth(0.4),
          2: FractionColumnWidth(0.15),
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
                  child: const Text('Qty.'),
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
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    product[index].quantity.toString(),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text((product[index].amount * product[index].quantity)
                      .toString()),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
