import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/Features/questions/domian/entities/question_entity.dart';
import 'package:online_exam_app/Features/questions/domian/use_cases/question_use_case.dart';
import 'package:online_exam_app/core/common/api_result.dart';
import 'package:online_exam_app/core/utils/cash_data.dart';
part 'questions_state.dart';

@injectable
class QuestionsCubit extends Cubit<QuestionsState> {
  final QuestionUseCase _questionUseCase;
  List<QuestionEntity> questionsList = [];
  int currentIndex = 0;
  List<int?> singleChoiceAnswers = []; // For single-choice answers

  List<List<bool>> multiChoiceAnswers = []; // For multiple-choice answers

  QuestionsCubit(this._questionUseCase) : super(QuestionsInitial());

  Future<void> getQuestionById() async {
    emit(QuestionsLoading());
    var token = SharedData.getData(key: StringCache.userToken);
    var id = SharedData.getData(key: StringCache.questionId);
    final result = await _questionUseCase.getQuestionById(id, token);
    if (result is Success<List<QuestionEntity>>) {
      questionsList = result.data;
      singleChoiceAnswers = List.filled(questionsList.length, null);
      multiChoiceAnswers =
          List.generate(questionsList.length, (_) => List.filled(4, false));
      emit(QuestionsSuccess(questionsList));
    } else if (result is Fail<List<QuestionEntity>>) {
      emit(QuestionsFail(result.exception));
    }
  }

  void selectSingleChoiceAnswer(int questionIndex, int answerIndex) {
    singleChoiceAnswers[questionIndex] = answerIndex;
    emit(QuestionsSuccess(questionsList));
  }

  void selectMultiChoiceAnswer(
      int questionIndex, int answerIndex, bool isSelected) {
    multiChoiceAnswers[questionIndex][answerIndex] = isSelected;
    emit(QuestionsSuccess(questionsList));
  }

  void nextQuestion() {
    if (currentIndex < questionsList.length - 1) {
      currentIndex++;
      emit(QuestionsSuccess(questionsList));
    }
  }

  void previousQuestion() {
    if (currentIndex > 0) {
      currentIndex--;
      emit(QuestionsSuccess(questionsList));
    }
  }
}
