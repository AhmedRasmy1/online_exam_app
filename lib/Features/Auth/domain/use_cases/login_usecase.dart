import 'package:injectable/injectable.dart';
import '../common/api_result.dart';
import '../entities/user.dart';
import '../repositories/auth_repo.dart';

@injectable
class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase(this.authRepo);

  Future<Result<User?>> invoke(String email, String password) {
    return authRepo.login(email, password);
  }
}
