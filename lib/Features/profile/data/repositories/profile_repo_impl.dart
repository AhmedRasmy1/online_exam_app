import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';
import 'package:online_exam_app/Features/profile/data/data_sources/profile_data_sources.dart';
import 'package:online_exam_app/Features/profile/domain/entities/ChangePasswordEntitie.dart';
import 'package:online_exam_app/Features/profile/domain/entities/edit_profile_entity.dart';
import 'package:online_exam_app/Features/profile/domain/repositories/profile_repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  ProfileDataSources profileDataSources;

  ProfileRepoImpl(this.profileDataSources);

  @override
  Future<Result<ChangePasswordEntities>> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String rePassword,
      required String token}) {
    return profileDataSources.changePassword(
        oldPassword, newPassword, rePassword, token);
  }

  @override
  Future<Result<EditProfileEntity?>> editProfile(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String token}) {
    return profileDataSources.editProfile(
        username, firstName, lastName, email, phone, token);
  }
}
