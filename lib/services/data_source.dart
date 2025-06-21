import 'package:programming_questions/core/theme/theme.dart';
/// data bor bu yerda
sealed class DataSource {
  static Future<List<Map<String, dynamic>>> convertor(String language) async {
    String path = "";

    if (language == "dart") {
      //  path = dartJunior;
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
