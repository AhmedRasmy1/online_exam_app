import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'login_view_state.dart';
import '../../../domain/common/api_result.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/use_cases/login_usecase.dart';

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
}
