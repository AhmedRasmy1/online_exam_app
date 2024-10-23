import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/utils/cash_data.dart';
import '../../../domain/common/api_result.dart';
import 'login_view_state.dart';
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
          await Future.wait([
            SharedData.setData(
                key: StringCache.userEmail, value: result.data?.email),
            //  SharedData.setData(key: StringCache.isActiveRemember, value: result.data?.email),
            SharedData.setData(
                key: StringCache.userLastName, value: result.data?.lastName),
            SharedData.setData(
                key: StringCache.userFirstName, value: result.data?.firstName),
            SharedData.setData(
                key: StringCache.userPhone, value: result.data?.phone),
            SharedData.setData(
                key: StringCache.userToken, value: result.data?.token),
            SharedData.setData(
                key: StringCache.userName, value: result.data?.username),
          ]);

          emit(SuccessState(result.data));
        }
      case Fail<User?>():
        {
          emit(ErrorState(result.exception));
        }
    }
  }
}
