import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../data_sources/profile_data_sources.dart';
import '../../domain/entities/change_password_entity.dart';
import '../../domain/entities/edit_profile_entity.dart';
import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager.dart';

@Injectable(as: ProfileDataSources)
class ProfileDataSourceImpl implements ProfileDataSources {
  ApiManager apiManager;

  ProfileDataSourceImpl(this.apiManager);

  @override
  Future<Result<ChangePasswordEntities>> changePassword(
      String oldPassword, String newPassword, String rePassword, String token) {
    return executeApi<ChangePasswordEntities>(
      () async {
        var response = await apiManager.changePassword(
            oldPassword, newPassword, rePassword, token);
        return response.toNewPassword();
      },
    );
  }

  @override
  Future<Result<EditProfileEntity>> editProfile(
      String username,
      String firstName,
      String lastName,
      String email,
      String phone,
      String token) {
    return executeApi<EditProfileEntity>(
      () async {
        var response = await apiManager.editProfile(
            username, firstName, lastName, email, phone, token);
        return response.toEditProfileEntity();
      },
    );
  }
}
