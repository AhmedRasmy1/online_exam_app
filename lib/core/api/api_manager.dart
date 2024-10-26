import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/Auth/domain/common/coustom_execption.dart';
import 'package:online_exam_app/Features/profile/data/models/ChangePasswordModel.dart';
import 'package:online_exam_app/Features/profile/data/models/edit_profile_model.dart';
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

  Future<AuthResponse> login(String email, String password) async {
    try {
      var response = await _dio.post(ApiConstants.signInUrl,
          data: {"email": email, "password": password});
      var authResponse = AuthResponse.fromJson(response.data);
      return authResponse;
    } on DioException catch (e) {
      throw ServerError(e.response?.statusCode,
          e.response?.data['message'] ?? 'Unknown Error');
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
      var authResponse = AuthResponse.fromJson(response.data);
      return authResponse;
    } on DioException catch (e) {
      throw ServerError(e.response?.statusCode,
          e.response?.data['message'] ?? 'Unknown Error');
    }
  }

  Future<ForgotPasswordModel> forgotPassword(String email) async {
    try {
      var response =
          await _dio.post(ApiConstants.forgotPassword, data: {"email": email});
      var forgotPasswordResponse = ForgotPasswordModel.fromJson(response.data);
      return forgotPasswordResponse;
    } on DioException catch (e) {
      throw ServerError(e.response?.statusCode,
          e.response?.data['message'] ?? "Unknown Error");
    }
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

      var changePasswordResponse = ChangePasswordModel.fromJson(response.data);
      return changePasswordResponse;
    } on DioException catch (e) {
      throw ServerError(e.response?.statusCode,
          e.response?.data['message'] ?? "Unknown Error");
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
      var editProfileResponse = EditProfileModel.fromJson(response.data);
      return editProfileResponse;
    } on DioException catch (e) {
      throw ServerError(e.response?.statusCode,
          e.response?.data['message'] ?? "Unknown Error");
    }
  }
}
