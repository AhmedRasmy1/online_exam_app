import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/explore/domain/entities/subjects_entity.dart';
import 'package:online_exam_app/Features/explore/domain/repositores/subjects_repo.dart';
import 'package:online_exam_app/core/common/api_result.dart';

@injectable
class SubjectsUseCase {
  SubjectsRepo subjectsRepo;
  SubjectsUseCase(this.subjectsRepo);
  Future<Result<List<SubjectEntity>>> getAllSubjects(String token) {
    return subjectsRepo.getAllSubjects(token);
  }
}
