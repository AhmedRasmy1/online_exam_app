import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';
import 'package:online_exam_app/Features/profile/domain/entities/ChangePasswordEntitie.dart';

abstract class ChangePasswordDataSources {

  Future<Result<ChangePasswordEntities>> changePassword(String oldPassword,
      String newPassword, String rePassword, String token);
}