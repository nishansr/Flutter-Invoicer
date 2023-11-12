import 'package:flutter/material.dart';
import 'package:invoicer/models/json_model.dart';
import 'package:invoicer/view/home/widgets/list_tile.dart';
import 'package:invoicer/view_model/json_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JsonProvider>(
      builder: (context, jsonProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Recent Invoices'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<String>>(
          future: jsonProvider.loadFileNames(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<String> fileNames = snapshot.data ?? [];
              if (fileNames.isEmpty) {
                return const Center(
                  child: Text(
                    'NO RECORDS',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: jsonProvider.jsonDataList.length,
                itemBuilder: (context, index) {
                  final JsonData jsonData = jsonProvider.jsonDataList[index];
                  return MyListTile(
                    title: jsonData.customer['name'],
                    subtitle: jsonData.customer['address'],
                    onTap: () {
                      jsonProvider.printJsonFileContents(
                          '${jsonData.customer['name']}.json');
                      Navigator.pushNamed(
                        context,
                        '/saved_result',
                        arguments: jsonData,
                      );
                    },
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
