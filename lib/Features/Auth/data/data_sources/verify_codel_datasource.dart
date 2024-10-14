import '../../domain/common/api_result.dart';

import '../../domain/entities/verify_code_entitie.dart';

abstract class VerifyCodeDataSource {
  Future<Result<VerifyCodeEntities?>> verifyCode(String code);
}
