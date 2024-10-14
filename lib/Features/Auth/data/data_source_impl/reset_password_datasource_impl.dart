import 'package:injectable/injectable.dart';
import '../data_sources/reset_password_datasource.dart';
import '../../domain/common/api_result.dart';
import '../../domain/entities/reset_password_entities.dart';

import '../api/api_extentions.dart';
import '../api/api_manager.dart';

@Injectable(as: ResetPasswordDataSource)
class ResetPasswordDatasourceImpl implements ResetPasswordDataSource {
  ApiManager apiManager;
  ResetPasswordDatasourceImpl(this.apiManager);
  @override
  Future<Result<ResetPasswordEntities?>> resetPassword(
      String email, String newPassword) {
    return executeApi<ResetPasswordEntities?>(() async {
      var responseReset = await apiManager.resetPassword(email, newPassword);

      return responseReset.toResetPassword();
    });
  }
}
