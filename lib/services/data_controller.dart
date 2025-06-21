
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:programming_questions/model/question_model.dart';
import 'package:programming_questions/services/path.dart';

class DataController {
  DataController._();
  static final DataController _instance = DataController._();
  factory DataController() => _instance;

  List<QuestionModel> _items = [];
  List<QuestionModel> get items => _items;

  /// jsonlar list

  Future<void> initialize(String language, int level) async {
    String path = _getPath(language, level);

    final jsonString = await rootBundle.loadString(path);
    print("Path>>> $path");
    final List<dynamic> jsonData = json.decode(jsonString);
    _items = jsonData.map((item) => QuestionModel.fromJson(item)).toList();
  }

  /// clear metod
  void clear() {
    _items = [];
  }

  String _getPath(String language, int level) {
    switch (language.toLowerCase()) {
      case "dart":
        return level == 0
            ? PathManager.dartJunior
            : level == 1
            ? PathManager.dartMiddle
            : PathManager.dartSenior;
      case "java":
        return level == 0
            ? PathManager.javaJunior
            : level == 1
            ? PathManager.javaMiddle
            : PathManager.javaSenior;
      case "javascript":
        return level == 0
            ? PathManager.javaScriptJunior
            : level == 1
            ? PathManager.javaScriptMiddle
            : PathManager.javaScriptSenior;
      case "python":
        return level == 0
            ? PathManager.pythonJunior
            : level == 1
            ? PathManager.pythonMiddle
            : PathManager.pythonSenior;
      default:
        throw Exception("Unknown language: $language");
    }
  }
}
