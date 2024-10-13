import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/api_result.dart';
import 'package:online_exam_app/domain/entities/verify_code_entitie.dart';
import 'package:online_exam_app/domain/use_cases/verifycode_usecase.dart';

@injectable
class VerifyCodeViewModel extends Cubit<VerifyCodeState> {
  final VerifyCodeUseCase verifyCodeUseCase;

  VerifyCodeViewModel(this.verifyCodeUseCase) : super(InitialState());

  void verifyCode({required String code}) async {
    emit(VerifyCodeLoading());
    var result = await verifyCodeUseCase.verifyCode(code);

    switch (result) {
      case Success<VerifyCodeEntities?>():
        {
          emit(VerifyCodeSuccess(result.data));
        }
      case Fail<VerifyCodeEntities?>():
        {
          emit(VerifyCodeError(result.exception));
        }
    }
  }
}

sealed class VerifyCodeState {}

class InitialState extends VerifyCodeState {}

class VerifyCodeSuccess extends VerifyCodeState {
  final VerifyCodeEntities? verifyCodeEntities;

  VerifyCodeSuccess(this.verifyCodeEntities);
}

class VerifyCodeLoading extends VerifyCodeState {}

class VerifyCodeError extends VerifyCodeState {
  final Exception? exception;

  VerifyCodeError(this.exception);
}
