import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/questions/data/data_sources/question_data_source.dart';
import 'package:online_exam_app/Features/questions/domian/entities/question_entity.dart';
import 'package:online_exam_app/Features/questions/domian/questions_repo/question_repo.dart';
import 'package:online_exam_app/core/common/api_result.dart';

@Injectable(as: QuestionRepo)
class QuestionRepoImpl implements QuestionRepo {
  QuestionDataSource questionDataSource;
  QuestionRepoImpl(this.questionDataSource);
  @override
  Future<Result<List<QuestionEntity>>> getQuestionById(
      String id, String token) {
    return questionDataSource.getQuestionById(id, token);
  }
}
