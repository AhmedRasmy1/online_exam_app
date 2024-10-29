import 'package:injectable/injectable.dart';
import '../data_sources/subjects_source.dart';
import '../../domain/entities/subjects_entity.dart';
import '../../domain/repositores/subjects_repo.dart';
import '../../../../core/common/api_result.dart';

@Injectable(as: SubjectsRepo)
class SubjectsRepoImpl implements SubjectsRepo {
  SubjectsSource subjectsSource;

  SubjectsRepoImpl(this.subjectsSource);
  @override
  Future<Result<List<SubjectEntity>>> getAllSubjects(String token) {
    return subjectsSource.getAllSubjects(token);
  }
}
