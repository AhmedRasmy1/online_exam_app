import '../../domain/entities/verify_code_entitie.dart';

/// status : "Success"

class VerifyCodeModel {
  String? status;

  VerifyCodeModel({
    this.status,
  });

  VerifyCodeModel.fromJson(dynamic json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }

  VerifyCodeEntities toVerifyCode() {
    return VerifyCodeEntities(
      status: status,
    );
  }
}
