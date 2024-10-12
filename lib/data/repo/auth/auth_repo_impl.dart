import 'package:injectable/injectable.dart';
import '../../contracts/auth/auth_online_datasource.dart';
import '../../../domain/entities/ForgotPasswordEntities.dart';
import '../../../domain/entities/User.dart';
import '../../../domain/repositories/auth_repo.dart';

import '../../../domain/common/api_result.dart';
import '../../contracts/auth/auth_offline_datasource.dart';
import '../../contracts/auth/fotgot_password_datasource.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthOffLineDataSource offLineDataSource;
  AuthOnLineDataSource onLineDataSource;
  ForgotPasswordDataSources forgotPasswordDataSources;

  AuthRepoImpl(this.offLineDataSource, this.onLineDataSource,
      this.forgotPasswordDataSources);

  @override
  Future<Result<User?>> login(String email, String password) {
    return onLineDataSource.login(email, password);
  }

  @override
  Future<Result<User?>> register(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) {
    return onLineDataSource.register(
        username, firstName, lastName, email, password, rePassword, phone);
  }

  @override
  Future<Result<ForgotPasswordEntities?>> forgotPassword(
      {required String email}) async {
    return forgotPasswordDataSources.forgotPassword(email);
  }
}
