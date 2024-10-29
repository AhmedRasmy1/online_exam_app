import '../../domain/entities/subjects_entity.dart';

class SubjectModel {
  final String id;
  final String name;
  final String icon;

  SubjectModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );
  }

  SubjectEntity toSubjectEntity() {
    return SubjectEntity(
      id: id,
      name: name,
      icon: icon,
    );
  }
}
