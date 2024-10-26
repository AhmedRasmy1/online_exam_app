import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../Features/Auth/domain/common/coustom_execption.dart';
import '../../Features/profile/data/models/change_password_model.dart';
import '../../Features/profile/data/models/edit_profile_model.dart';
import '../../Features/Auth/data/model/forgot_password_model.dart';
import '../../Features/Auth/data/model/reset_password_model.dart';
import '../../Features/Auth/data/model/response/auth_response.dart';
import '../../Features/Auth/data/model/verify_code_model.dart';
import 'api_constants.dart';

@singleton
class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  }

  Exception handleDioError(DioException e) {
    return ServerError(
      e.response?.statusCode,
      e.response?.data['message'] ?? 'Unknown Error',
    );
  }

  Future<AuthResponse> login(String email, String password) async {
    try {
      var response = await _dio.post(ApiConstants.signInUrl,
          data: {"email": email, "password": password});
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<AuthResponse> register(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) async {
    try {
      var response = await _dio.post(ApiConstants.signUpUrl, data: {
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone
      });
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<ForgotPasswordModel> forgotPassword(String email) async {
    try {
      var response =
          await _dio.post(ApiConstants.forgotPassword, data: {"email": email});
      return ForgotPasswordModel.fromJson(response.data);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<VerifyCodeModel> verifyCode(String resetCode) async {
    var response = await _dio
        .post(ApiConstants.verifyCodeApi, data: {"resetCode": resetCode});
    return VerifyCodeModel.fromJson(response.data);
  }

  Future<ResetPasswordModel> resetPassword(
    String email,
    String newPassword,
  ) async {
    var response = await _dio.put(ApiConstants.resetPassword,
        data: {"email": email, "newPassword": newPassword});
    return ResetPasswordModel.fromJson(response.data);
  }

  Future<ChangePasswordModel> changePassword(String oldPassword,
      String newPassword, String rePassword, String token) async {
    try {
      var tokenHeader = {"token": token};
      var response = await _dio.patch(ApiConstants.changePassword,
          data: {
            "oldPassword": oldPassword,
            "password": newPassword,
            "rePassword": rePassword
          },
          options: Options(method: 'PATCH', headers: tokenHeader));
      return ChangePasswordModel.fromJson(response.data);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<EditProfileModel> editProfile(String username, String firstName,
      String lastName, String email, String phone, String token) async {
    try {
      var tokenHeader = {"token": token};
      var response = await _dio.put(ApiConstants.editProfile,
          data: {
            "username": username,
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "phone": phone
          },
          options: Options(method: 'PUT', headers: tokenHeader));
      return EditProfileModel.fromJson(response.data);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
