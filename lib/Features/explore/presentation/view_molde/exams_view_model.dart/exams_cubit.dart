import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/exams_entity.dart';
import '../../../domain/use_cases/exams_use_case.dart';
import '../../../../../core/common/api_result.dart';
import '../../../../../core/utils/cash_data.dart';
part 'exams_state.dart';

@injectable
class ExamsCubit extends Cubit<ExamsState> {
  final ExamsUseCase _examsUseCase;
  ExamsCubit(this._examsUseCase) : super(ExamsInitial());

  Future<void> getExamById() async {
    emit(ExamsLoading());
    var id = SharedData.getData(key: StringCache.examId) ?? '';
    log("id: $id");
    var token = SharedData.getData(key: StringCache.userToken) ?? '';
    var result = await _examsUseCase.getExamById(id, token);
    log("result: $result");
    switch (result) {
      case Success<List<ExamsEntity>>():
        {
          log(result.data.toString());
          emit(ExamsSuccess(result.data));
        }
      case Fail<List<ExamsEntity>>():
        {
          log(result.exception.toString());
          emit(ExamsFail(result.exception));
        }
    }
  }
}
