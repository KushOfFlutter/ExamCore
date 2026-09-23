


class ReplayQuestionModel {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final int selectedAnswerIndex;
  final int timeSpentSeconds;

  ReplayQuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
    required this.timeSpentSeconds,
  });
}