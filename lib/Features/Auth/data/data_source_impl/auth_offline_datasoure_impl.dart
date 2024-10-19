import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';
import '../../domain/entities/user.dart';

import '../data_sources/auth_offline_datasource.dart';

@Injectable(as: AuthOffLineDataSource)
class AuthOffLineDataSourceImpl implements AuthOffLineDataSource {
  @override
  Future<Result<User?>> login(String email, String password) {
    throw UnimplementedError();
  }
}
