

import '../../../../domain/entities/verify_code_entitie.dart';

class VerifyCodeModel{
  VerifyCodeModel({
    this.message,
    this.info,
  });

  VerifyCodeModel.fromJson(dynamic json) {
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
  VerifyCodeEntities toVerifyCode(){
    return VerifyCodeEntities(
      info:info ,
      message: message,
    );
  }
}
