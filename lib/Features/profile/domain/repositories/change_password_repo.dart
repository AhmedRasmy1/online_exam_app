



import '../../../Auth/domain/common/api_result.dart';
import '../entities/ChangePasswordEntitie.dart';

abstract class ChangePasswordRepo{


  Future<Result<ChangePasswordEntities>>changePassword({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
    required String token
});


}