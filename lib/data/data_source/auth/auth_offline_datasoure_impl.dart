import 'package:injectable/injectable.dart';
import '../../../domain/entities/User.dart';

import '../../../domain/common/api_result.dart';
import '../../contracts/auth/auth_offline_datasource.dart';

@Injectable(as: AuthOffLineDataSource)
class AuthOffLineDataSourceImpl implements AuthOffLineDataSource {
  @override
  Future<Result<User?>> login(String email, String password) {
    throw UnimplementedError();
  }
}
