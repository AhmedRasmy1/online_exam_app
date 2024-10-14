import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api/model/forgot_password_model.dart';
import 'package:online_exam_app/data/api/api/model/reset_password_model.dart';
import 'package:online_exam_app/data/api/api/model/verify_code_model.dart';
import '../../../domain/entities/reset_password_entities.dart';
import '../../../domain/entities/verify_code_entitie.dart';
import 'model/ResetPasswordModel.dart';
import 'model/VerifCodeModel.dart';
import 'model/response/auth_response.dart';
import '../../../domain/entities/ForgotPasswordEntities.dart';

import 'ApiConstants.dart';

@singleton
class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  }

  Future<AuthResponse> login(String email, String password) async {
    var response = await _dio.post(ApiConstants.signInUrl,
        data: {"email": email, "password": password});
    var authResponse = AuthResponse.fromJson(response.data);
    return authResponse;
  }

  Future<AuthResponse> register(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) async {
    var response = await _dio.post(ApiConstants.signUpUrl, data: {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "phone": phone
    });
    var authResponse = AuthResponse.fromJson(response.data);
    print(response.data);
    return authResponse;
  }

  Future<ForgotPasswordModel> forgotPassword(String email) async {
    var response =
        await _dio.post(ApiConstants.forgotPassword, data: {"email": email});
    var forgotPasswordResponse = ForgotPasswordModel.fromJson(response.data);
    return forgotPasswordResponse;
  }

  Future<VerifyCodeModel> verifyCode(String resetCode) async {
    var response = await _dio
        .post(ApiConstants.verifyCodeApi, data: {"resetCode": resetCode});
    var verifyCodedResponse = VerifyCodeModel.fromJson(response.data);

    return verifyCodedResponse;
  }

  Future<ResetPasswordModel> resetPassword(
    String email,
    String newPassword,
  ) async {
    var response = await _dio.put(ApiConstants.resetPassword,
        data: {"email": email, "newPassword": newPassword});
    var resetPasswordResponse = ResetPasswordModel.fromJson(response.data);

    return resetPasswordResponse;
  }
}
