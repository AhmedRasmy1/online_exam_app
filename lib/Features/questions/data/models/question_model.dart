import 'package:online_exam_app/Features/questions/domian/entities/question_entity.dart';

class QuestionModel {
  final String id;
  final String question;
  final List<AnswerModel> answers;
  final String correctAnswer;
  final String subjectId;
  final String subjectName;
  final String subjectIcon;
  final String examId;
  final String examTitle;
  final int examDuration;
  final int numberOfQuestions;
  final String type;

  QuestionModel({
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

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['_id'] as String,
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((answer) => AnswerModel.fromJson(answer as Map<String, dynamic>))
          .toList(),
      correctAnswer: json['correct'] as String,
      subjectId: json['subject']['_id'] as String,
      subjectName: json['subject']['name'] as String,
      subjectIcon: json['subject']['icon'] as String,
      examId: json['exam']['_id'] as String,
      examTitle: json['exam']['title'] as String,
      examDuration: json['exam']['duration'] as int,
      numberOfQuestions: json['exam']['numberOfQuestions'] as int,
      type: json['type'] as String,
    );
  }

  QuestionEntity toQuestionEntity() {
    return QuestionEntity(
      id: id,
      question: question,
      answers: answers.map((answer) => answer.toAnswerEntity()).toList(),
      correctAnswer: correctAnswer,
      subjectId: subjectId,
      subjectName: subjectName,
      subjectIcon: subjectIcon,
      examId: examId,
      examTitle: examTitle,
      examDuration: examDuration,
      numberOfQuestions: numberOfQuestions,
      type: type,
    );
  }
}

class AnswerModel {
  final String answer;
  final String key;

  AnswerModel({required this.answer, required this.key});

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      answer: json['answer'] as String,
      key: json['key'] as String,
    );
  }

  AnswerEntity toAnswerEntity() {
    return AnswerEntity(
      answer: answer,
      key: key,
    );
  }
}
