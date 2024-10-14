import '../../../domain/entities/verify_code_entitie.dart';

sealed class VerifyCodeState {}

class InitialVerifyState extends VerifyCodeState {}

class VerifyCodeSuccess extends VerifyCodeState {
  final VerifyCodeEntities? verifyCodeEntities;

  VerifyCodeSuccess(this.verifyCodeEntities);
}

class VerifyCodeLoading extends VerifyCodeState {}

class VerifyCodeError extends VerifyCodeState {
  final Exception? exception;

  VerifyCodeError(this.exception);
}
