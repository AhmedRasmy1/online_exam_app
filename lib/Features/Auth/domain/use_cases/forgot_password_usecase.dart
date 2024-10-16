import 'package:injectable/injectable.dart';
import '../entities/forgot_password_entities.dart';
import '../repositories/auth_repo.dart';

import '../common/api_result.dart';

@injectable
class ForgotUseCase {
  AuthRepo authRepo;

  ForgotUseCase(this.authRepo);

  Future<Result<ForgotPasswordEntities?>> forgotPassword(String email) {
    return authRepo.forgotPassword(email: email);
  }
}
