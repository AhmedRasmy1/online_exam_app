import '../../../../../domain/entities/User.dart';

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
