import 'package:flutter/material.dart';
import 'package:programming_questions/services/data_controller.dart';

class AppProvider extends ChangeNotifier {
  int questionIndex = 0;
  int correctAnswers = 0;
  bool showLink = false;
  final DataController dataController = DataController();

  int update(int n) {
    n = n++;
    notifyListeners();
    return n;
  }

  void checkAnswerAndIncrementIndex(
    List<String> variants,
    String correctAnswer,
  ) {
    if (variants.contains(correctAnswer)) {
      correctAnswers++;
    }
    questionIndex++;
    notifyListeners();
  }

  void toggleShowLink() {
    showLink = !showLink;
    notifyListeners();
  }

  int levelProgrammen(int level) {
    int levelProgrammer = 0;
    return levelProgrammer;
  }
}
