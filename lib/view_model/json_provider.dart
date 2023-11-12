import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:invoicer/models/json_model.dart';
import 'package:path_provider/path_provider.dart';

class JsonProvider extends ChangeNotifier {
  List<String> fileNames = [];
  List<JsonData> jsonDataList = [];

  JsonProvider() {
    loadFileNames();
  }

  Future<List<String>> loadFileNames() async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      List<FileSystemEntity> files = directory.listSync();

      List<String> newFileNames = [];
      List<JsonData> newJsonDataList = [];

      files.forEach((file) {
        if (file is File && file.path.endsWith('.json')) {
          newFileNames.add(file.uri.pathSegments.last);

          final String jsonContent = file.readAsStringSync();
          final Map<String, dynamic> jsonDataMap = json.decode(jsonContent);
          final jsonData = JsonData(
            customer: jsonDataMap['customer'],
            date: DateTime.parse(jsonDataMap['date']),
            items: List<Map<String, dynamic>>.from(jsonDataMap['items']),
            sum: jsonDataMap['sum'],
          );
          newJsonDataList.add(jsonData);
        }
      });

      jsonDataList = newJsonDataList;

      if (!listEquals(fileNames, newFileNames)) {
        fileNames = newFileNames;
        notifyListeners();
      }

      return fileNames;
    } catch (e) {
      debugPrint('Error loading file names: $e');
      return [];
    }
  }

  Future<void> printJsonFileContents(String filename) async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/$filename';

      final File file = File(filePath);
      if (await file.exists()) {
        final String content = await file.readAsString();
        debugPrint('Contents of $filename:');
        debugPrint(content);
      }
    } catch (e) {
      debugPrint('Error reading JSON file contents: $e');
    }
  }

  Future<void> deleteFile(String filename) async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/$filename';

      final File file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        debugPrint('File deleted successfully: $filename');
      } else {
        debugPrint('File not found: $filename');
      }
    } catch (e) {
      debugPrint('Error deleting file: $e');
    }

    notifyListeners();
  }
}
