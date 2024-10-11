import 'package:injectable/injectable.dart';

import '../common/api_result.dart';
import '../entities/User.dart';

abstract class AuthRepo {
  Future<Result<User?>>  login(
    String email,
    String password,
  );

  Future<Result<User?>>  register(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}
