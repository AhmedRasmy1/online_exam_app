import '../../../Auth/domain/common/api_result.dart';
import '../../domain/entities/change_password_entity.dart';
import '../../domain/entities/edit_profile_entity.dart';

abstract class ProfileDataSources {
  Future<Result<ChangePasswordEntities>> changePassword(
      String oldPassword, String newPassword, String rePassword, String token);
  Future<Result<EditProfileEntity>> editProfile(
      String username,
      String firstName,
      String lastName,
      String email,
      String phone,
      String token);
}
