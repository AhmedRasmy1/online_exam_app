import 'package:injectable/injectable.dart';

import '../common/api_result.dart';

import '../entities/verify_code_entitie.dart';
import '../repositories/auth_repo.dart';
@injectable
class VerifyCodeUseCase {
  AuthRepo authRepo;

  VerifyCodeUseCase(this.authRepo);

  Future<Result<VerifyCodeEntities?>> verifyCode(String code) {
    return authRepo.verifyCode(code: code);
  }
}
