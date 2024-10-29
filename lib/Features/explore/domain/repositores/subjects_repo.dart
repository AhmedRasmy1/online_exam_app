import '../entities/subjects_entity.dart';
import '../../../../core/common/api_result.dart';

abstract class SubjectsRepo {
  Future<Result<List<SubjectEntity>>> getAllSubjects(String token);
}
