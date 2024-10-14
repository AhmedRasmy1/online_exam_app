import 'package:injectable/injectable.dart';
import '../entities/reset_password_entities.dart';
import '../repositories/auth_repo.dart';

import '../common/api_result.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepo authRepo;

  ResetPasswordUseCase(this.authRepo);

  Future<Result<ResetPasswordEntities?>> resetPassword(
      String email, String newPassword) {
    return authRepo.resetPassword(email: email, newPassword: newPassword);
  }
}
