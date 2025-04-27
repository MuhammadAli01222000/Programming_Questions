import 'dart:convert';
import 'package:flutter/services.dart';

/// Pyhton
const pythonJunior = "assets/json/python.json";
const pythonMiddle = "assets/json/python_middle/pyhton_middle.json";
const pythonSenior = "assets/json/python_senior/python_senior.json";

///Java
const javaJunior = "assets/json/java.json";
const javaMiddle = "assets/json/java_middle/java_middle.json";
const javaSenior = "assets/json/java_senior/java_senior.json";

/// Java Script
const javaScriptJunior = "assets/json/java_script.json";
const javaScriptMiddle =
    "assets/json/java_script_middle/java_script_middle.json";
const javaScriptSenior =
    "assets/json/java_script_senior/java_script_senior.json";

/// Dart
const dartJunior = "assets/json/data.json";
const dartMiddle = "assets/json/dart_middle/middle.json";
const dartSenior = "assets/json/dart_senior/senior.json";

/// data bor bu yerda
sealed class DataSource {
  static Future<List<Map<String, dynamic>>> convertor(String language) async {
    String path = "";

    if (language == "dart") {
      path = dartJunior;
    } else if (language == "java") {
      path = "assets/questions/java_questions.json";
    } else if (language == "javascript") {
      path = "assets/questions/javascript_questions.json";
    } else if (language == "python") {
      path = "assets/questions/python_questions.json";
    }

    final jsonString = await rootBundle.loadString(path);
    final List<dynamic> jsonData = json.decode(jsonString);
    return List<Map<String, dynamic>>.from(jsonData);
  }
}
