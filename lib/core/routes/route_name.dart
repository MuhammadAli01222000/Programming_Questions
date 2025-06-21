sealed class AppRouteName{
  static final home="home";
  static final error ="error";
  static final question="question";
  static final splash="splash";
  static final result="result";
  static final questionsWithAi="questionsWithAi";
}
sealed class AppRoutePath {
  static const splash = '/';
  static const home = '/home/:index';
  static const result = '/result';
  static const error = '/error';
  static const question = '/question';
  static const questionsWithAi = '/question-ai';
}
