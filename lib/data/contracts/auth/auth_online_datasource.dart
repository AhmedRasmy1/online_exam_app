
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/entities/User.dart';

import '../../../domain/common/api_result.dart';

abstract class AuthOnLineDataSource{
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