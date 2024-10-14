import '../../../domain/entities/reset_password_entities.dart';

import '../../../domain/common/api_result.dart';

abstract class ResetPasswordDataSource {
  Future<Result<ResetPasswordEntities?>> resetPassword(
      String email, String newPassword);
}
