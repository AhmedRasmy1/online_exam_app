import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/explore/data/data_sources/subjects_source.dart';
import 'package:online_exam_app/Features/explore/domain/entities/subjects_entity.dart';
import 'package:online_exam_app/core/api/api_extentions.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/core/common/api_result.dart';

@Injectable(as: SubjectsSource)
class SubjectSourceImpl implements SubjectsSource {
  ApiManager apiManager;
  SubjectSourceImpl(this.apiManager);
  @override
  Future<Result<List<SubjectEntity>>> getAllSubjects(String token) {
    return executeApi<List<SubjectEntity>>(() async {
      var response = await apiManager.getAllSubjects(token);
      return response.map((subject) => subject.toSubjectEntity()).toList();
    });
  }
}
