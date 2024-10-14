import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/common/api_result.dart';
import '../../../../domain/entities/User.dart';
import '../../../../domain/use_cases/register_usecase.dart';

@injectable
class RigesterViewModel extends Cubit<RigesterScreenState> {
  RegisterUseCase registerUseCase;
  RigesterViewModel(this.registerUseCase) : super(InitialState());
  void register(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) async {
    var result = await registerUseCase.register(
        username, firstName, lastName, email, password, rePassword, phone);
    switch (result) {
      case Success<User?>():
        {
          emit(SuccessRigesterState(result.data));
        }
      case Fail<User?>():
        {
          emit(ErrorRigesterState(result.exception));
        }
    }
  }
}

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
