import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as context;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:programming_questions/pages/home.dart';
import 'package:programming_questions/pages/splash_screen.dart';
import '../../../secrets.dart';

import '../../model/question_model.dart';
import '../../provider/l10n_provider.dart';
List list=[];
class NetworkStatus with ChangeNotifier {
  bool _hasConnection = true;

  bool get hasConnection => _hasConnection;

  NetworkStatus() {
    _checkStatus();
    InternetConnectionChecker().onStatusChange.listen((status) {
      _hasConnection = status == InternetConnectionStatus.connected;
      notifyListeners();
    });
  }

  void _checkStatus() async {
    _hasConnection = await InternetConnectionChecker().hasConnection;
    notifyListeners();
  }

  Future<List<QuestionModel>> generateContentWithGemini() async {

print(l10n);
    final String myApiKey = apiKey;
    final url =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$myApiKey';

    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      "contents": [
        {
          "parts": [
            {
              "text": """
$selectedLanguage tiliga oid 20 ta murakkab test savollarini tuzing. Har bir savol quyidagi JSON formatda bo‘lsin  savollarni $l10n tilida bolsin:

{
  "id": 1,
  "question": "Savol matni",
  "variant": ["A", "B", "C", "D"],
  "correct answer": "To‘g‘ri javob varianti",
  "infoLink": "https://tegishli-link.com"
}

- Har bir savol uchun 'id' qiymati 1 dan boshlab ortib borsin.
- Faqat JSON massiv ko‘rinishida javob yozing. Hech qanday izoh, matn, yoki tushuntirish yozmang.
- JSON hujjati quyidagi ko‘rinishda bo‘lishi kerak:
[
  {...}, 
  {...}, 
  ...
]

$selectedLanguage = "Dart" yoki "Python" yoki  "Java" yoki "Java Script " bolsa javob qaytar .
"""
            }
          ]

        },
      ],
    });
 //   print(body);
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['candidates'][0]['content']['parts'][0]['text'] as String;

        final jsonText = content
            .replaceAll("```json", "")
            .replaceAll("```", "")
            .trim();

        final decoded = jsonDecode(jsonText) as List<dynamic>;

        final questionList = decoded
            .map((questionJson) => QuestionModel.fromJson(questionJson))
            .toList();
list=questionList;
        return questionList;
      }
      else {
        print("Xato: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Kechirasiz, xato yuz berdi >>>>>> $e");
      return [];
    }
  }
}
