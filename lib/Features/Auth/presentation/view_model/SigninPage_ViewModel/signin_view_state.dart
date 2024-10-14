import '../../../domain/entities/user.dart';

sealed class RigesterScreenState {}

class InitialState extends RigesterScreenState {}

class SuccessRigesterState extends RigesterScreenState {
  User? user;

  SuccessRigesterState(this.user);
}

class LoadingRigesterState extends RigesterScreenState {}

class ErrorRigesterState extends RigesterScreenState {
  Exception? exception;

  ErrorRigesterState(this.exception);
}
