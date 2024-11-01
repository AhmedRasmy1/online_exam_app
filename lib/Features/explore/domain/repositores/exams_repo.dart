import '../entities/exams_entity.dart';
import '../../../../core/common/api_result.dart';

abstract class ExamsRepo {
  Future<Result<List<ExamsEntity>>> getExamById(String id, String token);
}
