import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../data_sources/profile_data_sources.dart';
import '../../domain/entities/change_password_entity.dart';
import '../../domain/entities/edit_profile_entity.dart';
import '../../domain/repositories/profile_repo.dart';

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
