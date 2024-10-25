import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';
import 'package:online_exam_app/Features/profile/domain/entities/ChangePasswordEntitie.dart';
import 'package:online_exam_app/Features/profile/domain/repositories/profile_repo.dart';

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
