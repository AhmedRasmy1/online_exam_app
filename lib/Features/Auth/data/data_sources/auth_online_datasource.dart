import '../../domain/entities/forgot_password_entities.dart';
import '../../domain/entities/reset_password_entities.dart';
import '../../domain/entities/verify_code_entitie.dart';

import '../../domain/entities/user.dart';

import '../../domain/common/api_result.dart';

abstract class AuthOnLineDataSource {
  Future<Result<User?>> login(
    String email,
    String password,
  );

  Future<Result<User?>> register(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  );
  Future<Result<ForgotPasswordEntities?>> forgotPassword(String email);
  Future<Result<VerifyCodeEntities?>> verifyCode(String code);
  Future<Result<ResetPasswordEntities?>> resetPassword(
      String email, String newPassword);
}
