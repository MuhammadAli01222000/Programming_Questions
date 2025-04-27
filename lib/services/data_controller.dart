import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:programming_questions/model/question_model.dart';
import 'package:programming_questions/services/data_source.dart';

class DataController {
  DataController._();
  static final DataController _instance = DataController._();
  factory DataController() => _instance;

  List<QuestionModel> _items = [];
  List<QuestionModel> get items => _items;
  Future<void> initilize(String language, int level) async {
    String path = '';

    /// dart tiliga check
    if (language == "dart") {
      if (level == 0) {
        path = dartJunior;
      } else if (level == 1) {
        path = dartMiddle;
      } else if (level == 2) {
        path = dartSenior;
      }
    }

    ///java ga check
    if (language == "java") {
      if (level == 0) {
        path = javaJunior;
      } else if (level == 1) {
        path = javaMiddle;
      } else if (level == 2) {
        path = javaSenior;
      }
    }

    /// Js ga check
    if (language == "javascript") {
      if (level == 0) {
        path = javaScriptJunior;
      } else if (level == 1) {
        path = javaScriptMiddle;
      } else if (level == 2) {
        path = javaScriptSenior;
      }
    }
    if (language == "python") {
      if (level == 0) {
        path = pythonJunior;
      } else if (level == 1) {
        path = pythonMiddle;
      } else if (level == 2) {
        path = pythonSenior;
      }
    }

    ///Python ga check

    final jsonString = await rootBundle.loadString(path);
    final List<dynamic> jsonData = json.decode(jsonString);
    _items = jsonData.map((item) => QuestionModel.fromJson(item)).toList();
  }
}
