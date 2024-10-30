import 'package:injectable/injectable.dart';
import '../entities/exams_entity.dart';
import '../repositores/exams_repo.dart';
import '../../../../core/common/api_result.dart';

@injectable
class ExamsUseCase {
  ExamsRepo examsRepo;
  ExamsUseCase(this.examsRepo);
  Future<Result<List<ExamsEntity>>> getExamById(String id, String token) async {
    return await examsRepo.getExamById(id, token);
  }
}
