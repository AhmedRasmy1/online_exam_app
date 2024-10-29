import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../entities/change_password_entity.dart';
import '../repositories/profile_repo.dart';

@injectable
class ChangePasswordUseCase {
  ProfileRepo profileRepo;

  ChangePasswordUseCase(this.profileRepo);

  Future<Result<ChangePasswordEntities>> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String rePassword,
      required String token}) {
    return profileRepo.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        rePassword: rePassword,
        token: token);
  }
}
