import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../../core/common/api_result.dart';
import '../../../domain/entities/change_password_entity.dart';
import '../../../domain/use_cases/change_password_use_case.dart';
import '../../../../../core/utils/cash_data.dart';
part 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._changePasswordUseCase)
      : super(ChangePasswordInitial());
  final ChangePasswordUseCase _changePasswordUseCase;

  void changePassword(
      {required String oldPassword,
      required String newPassword,
      required String rePassword}) async {
    String token = SharedData.getData(key: StringCache.userToken) ?? '';

    var result = await _changePasswordUseCase.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        rePassword: rePassword,
        token: token);

    switch (result) {
      case Success<ChangePasswordEntities>():
        {
          emit(ChangePasswordSuccess(result.data));
        }
      case Fail<ChangePasswordEntities>():
        {
          emit(ChangePasswordFail(result.exception));
        }
    }
  }
}
