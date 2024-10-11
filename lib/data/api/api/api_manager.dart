import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api/model/request/register_request.dart';
import 'package:online_exam_app/data/api/api/model/response/auth_response.dart';

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

Future<AuthResponse>register(RegisterRequest registerBody)async{
    var response=await _dio.post(ApiConstants.signUpUrl);
    var authResponse=AuthResponse.fromJson(response.data);
    return authResponse;
}


}
