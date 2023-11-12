import 'package:flutter/material.dart';
import 'package:invoicer/models/json_model.dart';
import 'package:invoicer/view/components/my_button.dart';
import 'package:invoicer/view/home/widgets/saved_bill.dart';
import 'package:invoicer/view/result/widgets/bill_header.dart';

class SavedResultScreen extends StatelessWidget {
  final JsonData user;
  const SavedResultScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              BillHeader(
                name: user.customer['name'],
                address: user.customer['address'],
                date: user.date,
              ),
              SavedBill(
                itemCount: user.items.length,
                product: user.items,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Total'),
                    const SizedBox(width: 45.0),
                    Text('Rs. ${user.sum}'),
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
          Navigator.pop(context);
        },
      ),
    );
  }
}
