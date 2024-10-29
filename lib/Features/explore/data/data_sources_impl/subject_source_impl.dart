import 'package:injectable/injectable.dart';
import '../data_sources/subjects_source.dart';
import '../../domain/entities/subjects_entity.dart';
import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/common/api_result.dart';

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
