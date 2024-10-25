part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}
final class ChangePasswordLoading extends ChangePasswordState {}
final class ChangePasswordSuccess extends ChangePasswordState {
  final ChangePasswordEntities changePasswordEntities;

  ChangePasswordSuccess(this.changePasswordEntities);
}
final class ChangePasswordFail extends ChangePasswordState {
  final Exception exception;

  ChangePasswordFail(this.exception);
}
