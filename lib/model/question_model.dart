class QuestionModel {
  final int id;
  final String question;
  final List<String> variant;
  final String correctAnswer;
  final String infoLink;

  const QuestionModel({
    required this.infoLink,
    required this.id,
    required this.question,
    required this.variant,
    required this.correctAnswer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] as int,
      question: json['question'] as String,
      variant: List<String>.from(json['variant']),
      correctAnswer: json['correct answer'] as String,
      infoLink: json['infoLink'] as String,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'question': question,
      'variant': variant,
      'correct answer': correctAnswer,
      'infoLink': infoLink,
    };
  }
}
