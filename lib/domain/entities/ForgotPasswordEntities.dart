/// message : "success"
/// info : "OTP sent to your email"

class ForgotPasswordEntities {
  ForgotPasswordEntities({
    this.message,
    this.info,
  });

  ForgotPasswordEntities.fromJson(dynamic json) {
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
}
