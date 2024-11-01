import '../../domain/entities/exams_entity.dart';

class ExamsModel {
  final String id;
  final String title;
  final num duration;
  final String subject;
  final num numberOfQuestions;

  ExamsModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
  });

  factory ExamsModel.fromJson(Map<String, dynamic> json) {
    return ExamsModel(
      id: json['_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      duration: json['duration'] as num? ?? 0,
      subject: json['subject'] as String? ?? '',
      numberOfQuestions: json['numberOfQuestions'] as num? ?? 0,
    );
  }

  ExamsEntity toExamsEntity() {
    return ExamsEntity(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
    );
  }
}
