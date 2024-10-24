import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/common/api_result.dart';
import 'forget_password_view_state.dart';
import '../../../domain/entities/forgot_password_entities.dart';
import '../../../domain/use_cases/forgot_password_usecase.dart';

@injectable
class ForgotPasswordViewModel extends Cubit<ForgotScreenState> {
  ForgotPasswordViewModel(this.forgotUseCase) : super(InitialState());

  final ForgotUseCase forgotUseCase;

  void forgotPassword({required String email}) async {
    var result = await forgotUseCase.forgotPassword(email);
    switch (result) {
      case Success<ForgotPasswordEntities?>():
        {
          emit(SuccessState(result.data));
        }
      case Fail<ForgotPasswordEntities?>():
        {
          emit(ErrorState(result.exception));
        }
    }
  }
}
