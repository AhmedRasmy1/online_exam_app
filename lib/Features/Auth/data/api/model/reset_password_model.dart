import '../../../domain/entities/reset_password_entities.dart';

/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MGJmYTNhZTc3ZDY4NTk1YTI5MmRiYiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI4ODY3MDI1fQ.7zEFXdurHi4yw_6y9TSzE8JTXt1gUrRtRSQpBp836Ig"

class ResetPasswordModel {
  String? message;
  String? token;

  ResetPasswordModel({
    this.message,
    this.token,
  });

  ResetPasswordModel.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

  ResetPasswordEntities toResetPassword() {
    return ResetPasswordEntities(
      token: token,
      message: message,
    );
  }
}
