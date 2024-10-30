import 'package:injectable/injectable.dart';
import '../data_sources/exams_data_source.dart';
import '../../domain/entities/exams_entity.dart';
import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/common/api_result.dart';

@Injectable(as: ExamsDataSource)
class ExamsDataSourceImpl implements ExamsDataSource {
  ApiManager apiManager;

  ExamsDataSourceImpl(this.apiManager);
  @override
  Future<Result<List<ExamsEntity>>> getExamById(String id, String token) {
    return executeApi<List<ExamsEntity>>(() async {
      var response = await apiManager.getExamById(id, token);
      return response.map((exams) => exams.toExamsEntity()).toList();
    });
  }
}
