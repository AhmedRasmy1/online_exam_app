import '../../domain/entities/forgot_password_entities.dart';

import '../../domain/common/api_result.dart';

abstract class ForgotPasswordDataSources {
  Future<Result<ForgotPasswordEntities?>> forgotPassword(String email);
}
