


import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/contracts/auth/verify_codel_datasource.dart';
import 'package:online_exam_app/domain/common/api_result.dart';
import 'package:online_exam_app/domain/entities/verify_code_entitie.dart';

import '../../api/api/apiExtentions.dart';
import '../../api/api/api_manager.dart';
@Injectable(as:VerifyCodeDataSource )
class VerifyCodeDatasourceImpl implements VerifyCodeDataSource{

  ApiManager apiManager;

  VerifyCodeDatasourceImpl(this.apiManager);
  @override
  Future<Result<VerifyCodeEntities?>> verifyCode(String code) {
    return executeApi<VerifyCodeEntities?>(() async {
      var forgotResponse = await apiManager.verifyCode(code);
      return forgotResponse.toVerifyCode();
    });
  }


}