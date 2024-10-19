import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';

import '../entities/reset_password_entities.dart';
import '../repositories/auth_repo.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepo authRepo;

  ResetPasswordUseCase(this.authRepo);

  Future<Result<ResetPasswordEntities?>> resetPassword(
      String email, String newPassword) {
    return authRepo.resetPassword(email: email, newPassword: newPassword);
  }
}
