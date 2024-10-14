import '../../../domain/entities/reset_password_entities.dart';

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
