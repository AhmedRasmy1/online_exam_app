import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/subjects_entity.dart';
import '../../../domain/use_cases/subjects_use_case.dart';
import '../../../../../core/common/api_result.dart';
import '../../../../../core/utils/cash_data.dart';
part 'subjects_state.dart';

@injectable
class SubjectsCubit extends Cubit<SubjectsState> {
  SubjectsUseCase _subjectsUseCase;
  SubjectsCubit(this._subjectsUseCase) : super(SubjectsInitial());

  Future<void> getAllSubjects() async {
    emit(SubjectsLoading());
    var token = SharedData.getData(key: StringCache.userToken) ?? '';
    log("token: $token");
    var result = await _subjectsUseCase.getAllSubjects(token);
    log("result: $result");
    switch (result) {
      case Success<List<SubjectEntity>>():
        {
          log(result.data.toString());
          emit(SubjectsSuccess(result.data));
        }
      case Fail<List<SubjectEntity>>():
        {
          log(result.exception.toString());
          emit(SubjectsFail(result.exception));
        }
    }
  }
}
