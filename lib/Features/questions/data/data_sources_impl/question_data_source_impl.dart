import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/questions/data/data_sources/question_data_source.dart';
import 'package:online_exam_app/Features/questions/domian/entities/question_entity.dart';
import 'package:online_exam_app/core/api/api_extentions.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/core/common/api_result.dart';

@Injectable(as: QuestionDataSource)
class QuestionDataSourceImpl implements QuestionDataSource {
  ApiManager apiManager;
  QuestionDataSourceImpl(this.apiManager);
  @override
  Future<Result<List<QuestionEntity>>> getQuestionById(
      String id, String token) {
    return executeApi(() async {
      var response = await apiManager.getQuestionById(id, token);
      return response.map((question) => question.toQuestionEntity()).toList();
    });
  }
}
