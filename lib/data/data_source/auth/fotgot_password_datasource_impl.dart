import 'package:injectable/injectable.dart';
import '../../contracts/auth/fotgot_password_datasource.dart';
import '../../../domain/common/api_result.dart';
import '../../../domain/entities/ForgotPasswordEntities.dart';

import '../../api/api/apiExtentions.dart';
import '../../api/api/api_manager.dart';

@Injectable(as: ForgotPasswordDataSources)
class ForgotPasswordDatasource implements ForgotPasswordDataSources {
  ApiManager apiManager;

  ForgotPasswordDatasource(this.apiManager);

  @override
  Future<Result<ForgotPasswordEntities?>> forgotPassword(String email) async {
    return executeApi<ForgotPasswordEntities?>(() async {
      var forgotResponse = await apiManager.forgotPassword(email);
      return forgotResponse.toForgotPassword();
    });
  }
}
