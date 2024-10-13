
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/contracts/auth/reset_password_datasource.dart';
import 'package:online_exam_app/domain/common/api_result.dart';
import 'package:online_exam_app/domain/entities/reset_password_entities.dart';

import '../../api/api/apiExtentions.dart';
import '../../api/api/api_manager.dart';
@Injectable(as: ResetPasswordDataSource )
class ResetPasswordDatasourceImpl implements ResetPasswordDataSource{

  ApiManager apiManager;
  ResetPasswordDatasourceImpl(this.apiManager);
  @override
  Future<Result<ResetPasswordEntities?>> resetPassword(String email, String newPassword) {
    return executeApi<ResetPasswordEntities?>(() async {
      var responseReset = await apiManager.resetPassword(email, newPassword);

      return responseReset.toResetPassword();
    });
  }

}