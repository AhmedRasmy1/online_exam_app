import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';
import 'package:online_exam_app/Features/profile/data/data_sources/change_password_data_sources.dart';
import 'package:online_exam_app/Features/profile/domain/entities/ChangePasswordEntitie.dart';
import 'package:online_exam_app/Features/profile/domain/repositories/change_password_repo.dart';

@Injectable(as: ChangePasswordRepo)
class ChangePasswordRepoImpl implements ChangePasswordRepo {
  ChangePasswordDataSources changePasswordDataSources;

  ChangePasswordRepoImpl(this.changePasswordDataSources);

  @override
  Future<Result<ChangePasswordEntities>> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String rePassword,
      required String token
      }) {
    return changePasswordDataSources.changePassword(
        oldPassword, newPassword, rePassword,token);
  }
}
