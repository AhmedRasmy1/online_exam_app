import '../entities/edit_profile_entity.dart';

import '../../../../core/common/api_result.dart';
import '../entities/change_password_entity.dart';

abstract class ProfileRepo {
  Future<Result<ChangePasswordEntities>> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String rePassword,
      required String token});

  Future<Result<EditProfileEntity?>> editProfile({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String token,
  });
}
