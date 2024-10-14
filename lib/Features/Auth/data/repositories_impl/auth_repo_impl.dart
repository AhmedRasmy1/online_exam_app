import 'package:injectable/injectable.dart';
import '../data_sources/verify_codel_datasource.dart';
import '../../domain/entities/reset_password_entities.dart';
import '../../domain/entities/verify_code_entitie.dart';
import '../data_sources/auth_online_datasource.dart';
import '../../domain/entities/forgot_password_entities.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repo.dart';

import '../../domain/common/api_result.dart';
import '../data_sources/auth_offline_datasource.dart';
import '../data_sources/fotgot_password_datasource.dart';
import '../data_sources/reset_password_datasource.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthOffLineDataSource offLineDataSource;
  AuthOnLineDataSource onLineDataSource;
  ForgotPasswordDataSources forgotPasswordDataSources;
  VerifyCodeDataSource verifyCodeDataSource;
  ResetPasswordDataSource resetPasswordDataSource;

  AuthRepoImpl(
      this.offLineDataSource,
      this.onLineDataSource,
      this.forgotPasswordDataSources,
      this.verifyCodeDataSource,
      this.resetPasswordDataSource);

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
    return forgotPasswordDataSources.forgotPassword(email);
  }
//************************/

  @override
  Future<Result<VerifyCodeEntities?>> verifyCode({required String code}) {
    print("auth repo impl $code --------------");

    return verifyCodeDataSource.verifyCode(code);
  }
//************************/

  @override
  Future<Result<ResetPasswordEntities?>> resetPassword(
      {required String email, required String newPassword}) {
    return resetPasswordDataSource.resetPassword(email, newPassword);
  }
}