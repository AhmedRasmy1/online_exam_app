import '../../domain/entities/change_password_entity.dart';

class ChangePasswordModel {
  ChangePasswordModel({
    this.message,
    this.token,
  });

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

  ChangePasswordEntities toNewPassword() {
    return ChangePasswordEntities(
      token: token,
      message: message,
    );
  }
}
