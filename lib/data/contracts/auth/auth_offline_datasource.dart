import '../../../domain/common/api_result.dart';
import '../../../domain/entities/User.dart';

abstract class AuthOffLineDataSource {
  Future<Result<User?>> login(
    String email,
    String password,
  );
}
