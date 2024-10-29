import 'package:injectable/injectable.dart';
import '../entities/subjects_entity.dart';
import '../repositores/subjects_repo.dart';
import '../../../../core/common/api_result.dart';

@injectable
class SubjectsUseCase {
  SubjectsRepo subjectsRepo;
  SubjectsUseCase(this.subjectsRepo);
  Future<Result<List<SubjectEntity>>> getAllSubjects(String token) {
    return subjectsRepo.getAllSubjects(token);
  }
}
