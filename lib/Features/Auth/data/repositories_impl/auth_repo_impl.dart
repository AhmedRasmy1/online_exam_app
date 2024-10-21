import 'package:injectable/injectable.dart';
import '../../domain/common/api_result.dart';
import '../../domain/entities/reset_password_entities.dart';
import '../../domain/entities/verify_code_entitie.dart';
import '../data_sources/auth_online_datasource.dart';
import '../../domain/entities/forgot_password_entities.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_sources/auth_offline_datasource.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthOffLineDataSource offLineDataSource;
  AuthOnLineDataSource onLineDataSource;

  AuthRepoImpl(
    this.offLineDataSource,
    this.onLineDataSource,
  );

  @override
  Future<Result<User?>> login(String email, String password) {
    return onLineDataSource.login(email, password);
  }

//************************/
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
//************************/

  @override
  Future<Result<ForgotPasswordEntities?>> forgotPassword(
      {required String email}) async {
    return onLineDataSource.forgotPassword(email);
  }
//************************/

  @override
  Future<Result<VerifyCodeEntities?>> verifyCode({required String code}) {
    return onLineDataSource.verifyCode(code);
  }
//************************/

  @override
  Future<Result<ResetPasswordEntities?>> resetPassword(
      {required String email, required String newPassword}) {
    return onLineDataSource.resetPassword(email, newPassword);
  }
}
