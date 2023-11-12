import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillHeader extends StatelessWidget {
  final String name;
  final String address;
  final DateTime date;

  const BillHeader({
    Key? key,
    required this.name,
    required this.address,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logos/reev_logo.png',
                scale: 3.0,
              ),
              const Text('Tulsi Marga, Ranipauwa - 11, Pokhara'),
            ],
          ),
        ),
        const SizedBox(height: 9.0),
        const Divider(),
        const SizedBox(height: 9.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Invoice No. #344453453455'),
            Text('Date: ${DateFormat('yyyy/MM/dd').format(DateTime.now())}'),
          ],
        ),
        const SizedBox(height: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name'),
            Text('Address: $address'),
          ],
        ),
        const SizedBox(height: 14.0),
        const Divider(),
        const SizedBox(height: 14.0),
      ],
    );
  }
}
