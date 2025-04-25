class QuestionModel {
  final int numberQuestion;
  final String question;

  const QuestionModel({required this.numberQuestion, required this.question});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      numberQuestion: json['numberQuestion'] as int,
      question: json['question'] as String,
    );
  }

  Map<String, Object?> toJson() {
    return {'numberQuestion': numberQuestion, 'question': question};
  }
}
