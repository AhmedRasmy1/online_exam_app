import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';

import 'package:online_exam_app/Features/profile/domain/entities/edit_profile_entity.dart';
import 'package:online_exam_app/Features/profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:online_exam_app/core/utils/cash_data.dart';

part 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUseCase _editProfileUseCase;

  EditProfileCubit(
    this._editProfileUseCase,
  ) : super(EditProfileInitial());

  Future<void> editProfile({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    String token = SharedData.getData(key: StringCache.userToken) ?? '';

    print('Requesting to edit profile with data: ${{
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
    }} and token: $token');

    var result = await _editProfileUseCase.editProfile(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      token: token,
    );

    switch (result) {
      case Success<EditProfileEntity?>():
        {
          SharedData.setData(
              key: StringCache.userName, value: result.data?.username);
          SharedData.setData(
              key: StringCache.userFirstName, value: result.data?.firstName);
          SharedData.setData(
              key: StringCache.userLastName, value: result.data?.lastName);
          SharedData.setData(
              key: StringCache.userEmail, value: result.data?.email);
          SharedData.setData(
              key: StringCache.userPhone, value: result.data?.phone);
          emit(EditProfileSuccess(result.data!));
        }
      case Fail<EditProfileEntity?>():
        {
          emit(EditProfileFail(result.exception));
        }
    }
  }
}
