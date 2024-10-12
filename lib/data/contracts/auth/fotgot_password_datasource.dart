import 'package:online_exam_app/domain/entities/ForgotPasswordEntities.dart';

import '../../../domain/common/api_result.dart';

abstract class ForgotPasswordDataSources {
  Future<Result<ForgotPasswordEntities?>> forgotPassword(String email);
}
