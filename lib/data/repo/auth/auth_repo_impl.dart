import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam_app/data/data_source/auth/auth_offline_datasoure_impl.dart';
import 'package:online_exam_app/domain/entities/User.dart';
import 'package:online_exam_app/domain/repositories/auth_repo.dart';

import '../../../domain/common/api_result.dart';
import '../../contracts/auth/auth_offline_datasource.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthOffLineDataSource offLineDataSource;
  AuthOnLineDataSource onLineDataSource;

  AuthRepoImpl(this.offLineDataSource, this.onLineDataSource);

  @override
  Future<Result<User?>> login(String email, String password) {
    return onLineDataSource.login(email, password);
  }

  @override
  Future<Result<User?>> register(String username, String firstName,
      String lastName,
      String email, String password, String rePassword, String phone) {
    return onLineDataSource.register(
        username,
        firstName,
        lastName,
        email,
        password,
        rePassword,
        phone);
  }
}
