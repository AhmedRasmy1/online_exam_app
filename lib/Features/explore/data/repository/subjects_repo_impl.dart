import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/explore/data/data_sources/subjects_source.dart';
import 'package:online_exam_app/Features/explore/domain/entities/subjects_entity.dart';
import 'package:online_exam_app/Features/explore/domain/repositores/subjects_repo.dart';
import 'package:online_exam_app/core/common/api_result.dart';

@Injectable(as: SubjectsRepo)
class SubjectsRepoImpl implements SubjectsRepo {
  SubjectsSource subjectsSource;

  SubjectsRepoImpl(this.subjectsSource);
  @override
  Future<Result<List<SubjectEntity>>> getAllSubjects(String token) {
    return subjectsSource.getAllSubjects(token);
  }
}
