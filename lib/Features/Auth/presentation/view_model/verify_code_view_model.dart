import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/api_result.dart';
import 'package:online_exam_app/domain/entities/verify_code_entitie.dart';
import 'package:online_exam_app/domain/use_cases/verifycode_usecase.dart';

@injectable
class VerifyCodeViewModel extends Cubit<VerifyCodeState> {
  final VerifyCodeUseCase _verifyCodeUseCase;

  VerifyCodeViewModel(this._verifyCodeUseCase) : super(InitialVerifyState());

  void verifyCode({required String code}) async {
    var result = await _verifyCodeUseCase.verifyCode(code);
    print("${result.toString()}//////////////");
    switch (result) {
      case Success<VerifyCodeEntities?>():
        {
          print("success==============");
          emit(VerifyCodeSuccess(result.data));
        }
      case Fail<VerifyCodeEntities?>():
        {
          print("Fail==============");
          emit(VerifyCodeError(result.exception));
        }
    }
  }
}

sealed class VerifyCodeState {}

class InitialVerifyState extends VerifyCodeState {}

class VerifyCodeSuccess extends VerifyCodeState {
  VerifyCodeEntities? verifyCodeEntities;

  VerifyCodeSuccess(this.verifyCodeEntities);
}

class VerifyCodeLoading extends VerifyCodeState {}

class VerifyCodeError extends VerifyCodeState {
  Exception? exception;

  VerifyCodeError(this.exception);
}
