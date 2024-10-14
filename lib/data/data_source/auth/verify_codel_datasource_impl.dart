import 'package:injectable/injectable.dart';
import '../../contracts/auth/verify_codel_datasource.dart';
import '../../../domain/common/api_result.dart';
import '../../../domain/entities/verify_code_entitie.dart';

import '../../api/api/apiExtentions.dart';
import '../../api/api/api_manager.dart';

@Injectable(as: VerifyCodeDataSource)
class VerifyCodeDatasourceImpl implements VerifyCodeDataSource {
  ApiManager apiManager;

  VerifyCodeDatasourceImpl(this.apiManager);

  @override
  Future<Result<VerifyCodeEntities?>> verifyCode(String code) {
    return executeApi<VerifyCodeEntities?>(() async {
      var verifyCode = await apiManager.verifyCode(code);
      print("---------------------${verifyCode.status}");
      return verifyCode.toVerifyCode();
    });
  }
}
