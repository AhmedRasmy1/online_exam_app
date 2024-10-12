import 'package:injectable/injectable.dart';
import '../../api/api/apiExtentions.dart';
import '../../api/api/model/UserDto.dart';
import '../../../domain/common/api_result.dart';
import '../../../domain/entities/User.dart';

import '../../api/api/api_manager.dart';
import '../../contracts/auth/auth_online_datasource.dart';

@Injectable(as: AuthOnLineDataSource)
class AuthOnLineDataSourceImpl implements AuthOnLineDataSource {
  ApiManager apiManager;

  AuthOnLineDataSourceImpl(this.apiManager);

  @override
  Future<Result<User?>> login(String email, String password) async {
    return executeApi<User?>(() async {
      var authResponse = await apiManager.login(email, password);
      var user = UserDto(token: authResponse.token);
      return user.toUser();
    });
  }

  @override
  Future<Result<User?>> register(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) {
    // var body = RegisterRequest(
    //     password: password,
    //     rePassword: rePassword,
    //     firstName: firstName,
    //     phone: phone,
    //     email: email,
    //     lastName: lastName,
    //     username: username);
    return executeApi(() async {
      var response = await apiManager.register(
          username, firstName, lastName, email, password, rePassword, phone);
      var user = UserDto(token: response.token);
      return user.toUser();
    });
  }
}