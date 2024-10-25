import '../../domain/entities/ChangePasswordEntitie.dart';

/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MGJmYTNhZTc3ZDY4NTk1YTI5MmRiYiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI5ODA2OTQ1fQ.G9_i9Z3CAqGXUbWCFqD9Nhrhh44XfF8VEIoatWew4Yw"

class ChangePasswordModel {
  ChangePasswordModel({
      this.message, 
      this.token,});

  ChangePasswordModel.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }
  ChangePasswordEntities toNewPassword(){
    return ChangePasswordEntities(
      token:token ,
      message:message ,
    );
  }
}