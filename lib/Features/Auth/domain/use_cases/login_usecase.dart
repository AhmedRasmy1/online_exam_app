import 'package:injectable/injectable.dart';

import '../common/api_result.dart';
import '../entities/forgot_password_entities.dart';
import '../entities/user.dart';
import '../repositories/auth_repo.dart';

@injectable
class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase(this.authRepo);

  Future<Result<User?>> invoke(String email, String password) {
    return authRepo.login(email, password);
  }

  Future<Result<User?>> register(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) {
    return authRepo.register(
        username, firstName, lastName, email, password, rePassword, phone);
  }

  Future<Result<ForgotPasswordEntities?>> forgotPassword(String email) {
    return authRepo.forgotPassword(email: email);
  }
}