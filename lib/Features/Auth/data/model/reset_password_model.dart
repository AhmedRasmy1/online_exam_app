import '../../domain/entities/reset_password_entities.dart';

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
