import '../../../../../domain/entities/ForgotPasswordEntities.dart';

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
