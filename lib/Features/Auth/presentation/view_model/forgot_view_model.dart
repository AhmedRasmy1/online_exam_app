import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/entities/ForgotPasswordEntities.dart';
import 'package:online_exam_app/domain/use_cases/forgot_password_usecase.dart';
import '../../../../domain/common/api_result.dart';

@injectable
class ForgotPasswordViewModel extends Cubit<ForgotScreenState> {
  ForgotPasswordViewModel(this.forgotUseCase) : super(InitialState());



  final ForgotUseCase forgotUseCase;

  void forgotPassword({required String email})async{
    var result=await forgotUseCase.forgotPassword(email);
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

sealed class ForgotScreenState {}

class InitialState extends ForgotScreenState {}

class SuccessState extends ForgotScreenState {
  ForgotPasswordEntities? forgotPasswordEntities;

  SuccessState(this.forgotPasswordEntities);
}

class LoadingState extends ForgotScreenState {}

class ErrorState extends ForgotScreenState {
  Exception? exception;

  ErrorState(this.exception);
}
