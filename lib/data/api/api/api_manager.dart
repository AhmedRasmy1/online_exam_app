import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api/model/request/register_request.dart';
import 'package:online_exam_app/data/api/api/model/response/auth_response.dart';
import 'package:online_exam_app/domain/entities/ForgotPasswordEntities.dart';

import 'ApiConstants.dart';

@singleton
class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  }


Future<AuthResponse>login(String email,String password)async{
    var response=await _dio.post(ApiConstants.signInUrl,data: {
      "email":email,"password":password
    });
    var authResponse=AuthResponse.fromJson(response.data);
    return authResponse;
}

Future<AuthResponse>register( String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone)async{
    var response=await _dio.post(ApiConstants.signUpUrl,data: {
      "username":username,
      "firstName":firstName,
      "lastName":lastName,
      "email":email ,
      "password":password,
      "rePassword":rePassword,
      "phone":phone

    });
    var authResponse=AuthResponse.fromJson(response.data);
    return authResponse;
}

  Future<ForgotPasswordEntities>forgotPassword(String email)async{
    var response=await _dio.post(ApiConstants.forgotPassword,data: {
      "email":email
    });
    var forgotPasswordResponse=ForgotPasswordEntities.fromJson(response.data);
    return forgotPasswordResponse;
  }
  // Future<ForgotPasswordEntities>forgotPassword(String email)async{
  //   var response=await _dio.post(ApiConstants.forgotPassword,data: {
  //     "email":email
  //   });
  //   var forgotPasswordResponse=ForgotPasswordEntities.fromJson(response.data);
  //   return forgotPasswordResponse;
  // }

}
