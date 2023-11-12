import 'package:flutter/material.dart';
import 'package:invoicer/view_model/json_provider.dart';
import 'package:provider/provider.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const MyListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 1.0,
              color: Colors.white24,
            ),
          ),
        ),
        child: const Icon(
          Icons.autorenew,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
      subtitle: Row(
        children: <Widget>[
          const Icon(Icons.linear_scale, color: Colors.yellowAccent),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          Provider.of<JsonProvider>(context, listen: false).deleteFile('${title}.json');
        },
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
          size: 30.0,
        ),
      ),
    );
  }
}
