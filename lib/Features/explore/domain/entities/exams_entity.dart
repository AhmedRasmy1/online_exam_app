class ExamsEntity {
  final String id;
  final String title;
  final num duration;
  final String subject;
  final num numberOfQuestions;

  ExamsEntity({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
  });
}
