import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/Auth/data/api/api_extentions.dart';
import 'package:online_exam_app/Features/Auth/data/api/api_manager.dart';
import 'package:online_exam_app/Features/Auth/data/api/model/user_dto.dart';
import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';
import '../../domain/entities/forgot_password_entities.dart';
import '../../domain/entities/reset_password_entities.dart';
import '../../domain/entities/verify_code_entitie.dart';
import '../../domain/entities/user.dart';
import '../data_sources/auth_online_datasource.dart';

@Injectable(as: AuthOnLineDataSource)
class AuthOnLineDataSourceImpl implements AuthOnLineDataSource {
  ApiManager apiManager;

  AuthOnLineDataSourceImpl(this.apiManager);

  @override
  Future<Result<User?>> login(String email, String password) async {
    return executeApi<User?>(() async {
      var authResponse = await apiManager.login(email, password);

      return authResponse.toUser();
    });
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
    return executeApi(() async {
      var response = await apiManager.register(
          username, firstName, lastName, email, password, rePassword, phone);
      // var user = UserDto(token: response.token);
      // (user);
      return response.toUser();
    });
  }

  @override
  Future<Result<ForgotPasswordEntities?>> forgotPassword(String email) {
    return executeApi<ForgotPasswordEntities?>(() async {
      var forgotResponse = await apiManager.forgotPassword(email);
      return forgotResponse.toForgotPassword();
    });
  }

  @override
  Future<Result<ResetPasswordEntities?>> resetPassword(
      String email, String newPassword) {
    return executeApi<ResetPasswordEntities?>(() async {
      var responseReset = await apiManager.resetPassword(email, newPassword);
      return responseReset.toResetPassword();
    });
  }

  @override
  Future<Result<VerifyCodeEntities?>> verifyCode(String code) {
    return executeApi<VerifyCodeEntities?>(() async {
      var response = await apiManager.verifyCode(code);
      return response.toVerifyCode();
    });
  }
}
