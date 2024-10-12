import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/api_result.dart';

import '../../../../domain/entities/User.dart';
import '../../../../domain/use_cases/login_usecase.dart';

@injectable
class LoginViewModel extends Cubit<LoginScreenState> {
  LoginViewModel(this.loginUseCase) : super(InitialState());
  final LoginUseCase loginUseCase;

  void login(String email, String password) async {
    var result = await loginUseCase.invoke(email, password);
    switch (result) {
      case Success<User?>():
        {
          emit(SuccessState(result.data));
        }
      case Fail<User?>():
        {
          emit(ErrorState(result.exception));
        }
    }
  }

  void register(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) async {
    var result = await loginUseCase.register(
        username, firstName, lastName, email, password, rePassword, phone);
    switch (result) {
      case Success<User?>():
        {
          emit(SuccessState(result.data));
        }
      case Fail<User?>():
        {
          emit(ErrorState(result.exception));
        }
    }
  }
}

sealed class LoginScreenState {}

class InitialState extends LoginScreenState {}

class SuccessState extends LoginScreenState {
  User? user;

  SuccessState(this.user);
}

class LoadingState extends LoginScreenState {}

class ErrorState extends LoginScreenState {
  Exception? exception;

  ErrorState(this.exception);
}
