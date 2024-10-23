import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/common/api_result.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../domain/entities/reset_password_entities.dart';
import '../../../domain/use_cases/reset_password_usecase.dart';
import 'reset_password_view_state.dart';

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
