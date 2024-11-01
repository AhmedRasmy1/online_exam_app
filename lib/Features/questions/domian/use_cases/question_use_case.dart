import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/questions/domian/entities/question_entity.dart';
import 'package:online_exam_app/Features/questions/domian/questions_repo/question_repo.dart';
import 'package:online_exam_app/core/common/api_result.dart';

@injectable
class QuestionUseCase {
  QuestionRepo questionRepo;
  QuestionUseCase(this.questionRepo);
  Future<Result<List<QuestionEntity>>> getQuestionById(
      String id, String token) {
    return questionRepo.getQuestionById(id, token);
  }
}
