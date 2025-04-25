class QuestionModel {
  final int id;
  final String question;
  final List<String> variants;
  final String correctAnswer;
  final String infoLink;

  const QuestionModel({
    required this.infoLink,
    required this.id,
    required this.question,
    required this.variants,
    required this.correctAnswer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] as int,
      question: json['question'] as String,
      variants: List<String>.from(json['variant']),
      correctAnswer: json['correct answer'] as String,
      infoLink: json['infoLink'] as String,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'question': question,
      'variant': variants,
      'correct answer': correctAnswer,
      'infoLink': infoLink,
    };
  }
}
