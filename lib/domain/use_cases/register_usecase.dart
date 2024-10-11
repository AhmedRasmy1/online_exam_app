import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/repositories/auth_repo.dart';

import '../common/api_result.dart';
import '../entities/User.dart';
@injectable
class Register {
  AuthRepo authRepo;

  Register(this.authRepo);

  Future<Result<User?>> register(String username, String firstName, String lastName,
      String email, String password, String rePassword, String phone) {
    return authRepo.register(
        username, firstName, lastName, email, password, rePassword, phone);
  }
}
