import '../common/api_result.dart';
import '../entities/ForgotPasswordEntities.dart';
import '../entities/User.dart';
import '../entities/reset_password_entities.dart';
import '../entities/verify_code_entitie.dart';

abstract class AuthRepo {
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

  Future<Result<ForgotPasswordEntities?>> forgotPassword(
      {required String email});

  Future<Result<VerifyCodeEntities?>> verifyCode({required String code});
  Future<Result<ResetPasswordEntities?>> resetPassword(
      {required String email, required String newPassword});
}
