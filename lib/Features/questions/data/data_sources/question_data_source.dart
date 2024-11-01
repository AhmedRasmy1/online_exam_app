import 'package:online_exam_app/Features/questions/domian/entities/question_entity.dart';
import 'package:online_exam_app/core/common/api_result.dart';

abstract class QuestionDataSource {
  Future<Result<List<QuestionEntity>>> getQuestionById(String id, String token);
}
