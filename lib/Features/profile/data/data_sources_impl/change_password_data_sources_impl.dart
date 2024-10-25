import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';
import 'package:online_exam_app/Features/profile/data/data_sources/change_password_data_sources.dart';
import 'package:online_exam_app/Features/profile/domain/entities/ChangePasswordEntitie.dart';
import 'package:online_exam_app/core/api/api_extentions.dart';
import 'package:online_exam_app/core/api/api_manager.dart';

@Injectable(as: ChangePasswordDataSources)
class ChangePasswordDataSourcesImpl implements ChangePasswordDataSources {
  ApiManager apiManager;

  ChangePasswordDataSourcesImpl(this.apiManager);

  @override
  Future<Result<ChangePasswordEntities>> changePassword(
      String oldPassword, String newPassword, String rePassword ,String token) {
    return executeApi<ChangePasswordEntities>(
      () async {
        var response = await apiManager.changePassword(
            oldPassword, newPassword, rePassword,token);
        return response.toNewPassword();
      },
    );
  }
}
