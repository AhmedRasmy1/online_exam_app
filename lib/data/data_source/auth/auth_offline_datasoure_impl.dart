

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api/api_manager.dart';
import 'package:online_exam_app/domain/entities/User.dart';

import '../../../domain/common/api_result.dart';
import '../../contracts/auth/auth_offline_datasource.dart';
@Injectable(as:AuthOffLineDataSource )
class AuthOffLineDataSourceImpl implements AuthOffLineDataSource{

  @override
  Future<Result<User?>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
  
}