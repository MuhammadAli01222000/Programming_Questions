import 'package:flutter/material.dart';
import 'package:programming_questions/services/data_controller.dart';

class AppProvider extends ChangeNotifier {
  int questionIndex = 0;
  int correctAnswers = 0;
  int wrong = 0;
  bool showLink = false;
  final DataController dataController = DataController();

  // Savol indeksini yangilash
  int update(int n) {
    n = n++;
    notifyListeners();
    return n;
  }
int  setter(int n)=>0;
  void checkAnswerAndIncrementIndex(
    List<String> variants,
    String correctAnswer,
    String selectedAnswer,
  ) {
    if (selectedAnswer == correctAnswer) {
      correctAnswers++;
    } else {
      wrong++;
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
