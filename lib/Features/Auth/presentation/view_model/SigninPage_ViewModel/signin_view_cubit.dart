import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';
import 'signin_view_state.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/use_cases/register_usecase.dart';

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
