import 'package:flutter/material.dart';
import 'package:programming_questions/pages/home.dart';

class ProgrammingQuestions extends StatelessWidget {
  const ProgrammingQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
