import '../../domain/entities/forgot_password_entities.dart';

/// message : "success"
/// info : "OTP sent to your email"

class ForgotPasswordModel {
  ForgotPasswordModel({
    this.message,
    this.info,
  });

  ForgotPasswordModel.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
  }
  String? message;
  String? info;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['info'] = info;
    return map;
  }

  ForgotPasswordEntities toForgotPassword() {
    return ForgotPasswordEntities(
      info: info,
      message: message,
    );
  }
}
