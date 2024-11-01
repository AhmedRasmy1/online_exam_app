class QuestionEntity {
  final String id;
  final String question;
  final List<AnswerEntity> answers;
  final String correctAnswer;
  final String subjectId;
  final String subjectName;
  final String subjectIcon;
  final String examId;
  final String examTitle;
  final int examDuration;
  final int numberOfQuestions;
  final String type;

  QuestionEntity({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.subjectId,
    required this.subjectName,
    required this.subjectIcon,
    required this.examId,
    required this.examTitle,
    required this.examDuration,
    required this.numberOfQuestions,
    required this.type,
  });
}

class AnswerEntity {
  final String answer;
  final String key;

  AnswerEntity({
    required this.answer,
    required this.key,
  });
}
