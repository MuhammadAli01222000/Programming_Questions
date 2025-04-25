import 'dart:convert';
import 'package:flutter/services.dart';

/// data bor bu yerda
sealed class DataSource {
  static Future<List> convertor() async {
    String data = await rootBundle.loadString("assets/json/data.json");
    // print("data bor   $data");
    return jsonDecode(data);
  }
}
