import 'package:online_exam_app/Features/explore/domain/entities/subjects_entity.dart';

class SubjectModel {
  final String id;
  final String name;
  final String icon;
  final DateTime createdAt;

  SubjectModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.createdAt,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  SubjectEntity toSubjectEntity() {
    return SubjectEntity(
      id: id,
      name: name,
      icon: icon,
      createdAt: createdAt,
    );
  }
}
