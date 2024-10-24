import 'package:injectable/injectable.dart';
import '../common/api_result.dart';
import '../repositories/auth_repo.dart';
import '../entities/user.dart';

@injectable
class RegisterUseCase {
  AuthRepo authRepo;

  RegisterUseCase(this.authRepo);

  Future<Result<User?>> register(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) {
    return authRepo.register(
      username,
      firstName,
      lastName,
      email,
      password,
      rePassword,
      phone,
    );
  }
}
