import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';
import 'package:online_exam_app/Features/profile/domain/entities/ChangePasswordEntitie.dart';
import 'package:online_exam_app/Features/profile/domain/repositories/change_password_repo.dart';

@injectable
class ChangePasswordUseCase {
  ChangePasswordRepo changePasswordRepo;

  ChangePasswordUseCase(this.changePasswordRepo);

  Future<Result<ChangePasswordEntities>> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String rePassword,
      required String token}) {
    return changePasswordRepo.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        rePassword: rePassword,
      token: token

    );
  }
}
