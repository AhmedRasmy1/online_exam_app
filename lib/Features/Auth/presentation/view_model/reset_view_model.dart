import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/utils/cash_data.dart';
import 'package:online_exam_app/domain/entities/reset_password_entities.dart';
import 'package:online_exam_app/domain/use_cases/reset_password_usecase.dart';

import '../../../../domain/common/api_result.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordViewModel(this._resetPasswordUseCase) : super(InitialState());

  void resetPassword({required String newPassword}) async {
    var result = await _resetPasswordUseCase.resetPassword(
        SharedData.getData(key: StringCache.emailResetPassword), newPassword);
    switch (result) {
      case Success<ResetPasswordEntities?>():
        {
          emit(ResetPasswordSuccessState(result.data));
        }
      case Fail<ResetPasswordEntities?>():
        {
          print(result.exception);
          emit(ErrorState(result.exception));
        }
    }
  }
}

sealed class ResetPasswordState {}

class InitialState extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {
  ResetPasswordEntities? resetPasswordEntities;

  ResetPasswordSuccessState(this.resetPasswordEntities);
}

class LoadingState extends ResetPasswordState {}

class ErrorState extends ResetPasswordState {
  Exception? exception;

  ErrorState(this.exception);
}
