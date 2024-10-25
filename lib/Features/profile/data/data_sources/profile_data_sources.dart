import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';
import 'package:online_exam_app/Features/profile/domain/entities/ChangePasswordEntitie.dart';
import 'package:online_exam_app/Features/profile/domain/entities/edit_profile_entity.dart';

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
