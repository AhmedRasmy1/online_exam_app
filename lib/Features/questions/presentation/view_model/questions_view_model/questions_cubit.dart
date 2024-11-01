import 'dart:developer';
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
  List<QuestionEntity> questionsList = []; //! to store the questions
  int currentIndex = 0; //! to store the current index of the question
  QuestionsCubit(this._questionUseCase) : super(QuestionsInitial());

  Future<void> getQuestionById() async {
    emit(QuestionsLoading());
    var token = SharedData.getData(key: StringCache.userToken);
    log("token: $token");
    var id = SharedData.getData(key: StringCache.questionId);
    log("id: $id");
    final result = await _questionUseCase.getQuestionById(id, token);
    switch (result) {
      case Success<List<QuestionEntity>>():
        {
          questionsList = result.data;
          log(questionsList[currentIndex].toString());
          emit(QuestionsSuccess(questionsList)); //! for show the first question
        }
      case Fail<List<QuestionEntity>>():
        {
          log(result.exception.toString());
          emit(QuestionsFail(result.exception));
        }
    }
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
