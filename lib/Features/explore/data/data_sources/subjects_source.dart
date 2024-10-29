import 'package:online_exam_app/Features/explore/domain/entities/subjects_entity.dart';
import 'package:online_exam_app/core/common/api_result.dart';

abstract class SubjectsSource {
  Future<Result<List<SubjectEntity>>> getAllSubjects(String token);
}
