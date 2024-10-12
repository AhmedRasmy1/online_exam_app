// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api/api/api_manager.dart' as _i203;
import '../data/contracts/auth/auth_offline_datasource.dart' as _i93;
import '../data/contracts/auth/auth_online_datasource.dart' as _i62;
import '../data/contracts/auth/fotgot_password_datasource.dart' as _i937;
import '../data/data_source/auth/auth_offline_datasoure_impl.dart' as _i626;
import '../data/data_source/auth/auth_online_datasource_impl.dart' as _i127;
import '../data/data_source/auth/fotgot_password_datasource_impl.dart' as _i116;
import '../data/repo/auth/auth_repo_impl.dart' as _i602;
import '../domain/repositories/auth_repo.dart' as _i218;
import '../domain/use_cases/forgot_password_usecase.dart' as _i997;
import '../domain/use_cases/login_usecase.dart' as _i973;
import '../domain/use_cases/register_usecase.dart' as _i525;
import '../Features/Auth/presentation/view_model/forgot_view_model.dart'
    as _i887;
import '../Features/Auth/presentation/view_model/view_model.dart' as _i384;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i203.ApiManager>(() => _i203.ApiManager());
    gh.factory<_i93.AuthOffLineDataSource>(
        () => _i626.AuthOffLineDataSourceImpl());
    gh.factory<_i62.AuthOnLineDataSource>(
        () => _i127.AuthOnLineDataSourceImpl(gh<_i203.ApiManager>()));
    gh.factory<_i937.ForgotPasswordDataSources>(
        () => _i116.ForgotPasswordDatasource(gh<_i203.ApiManager>()));
    gh.factory<_i218.AuthRepo>(() => _i602.AuthRepoImpl(
          gh<_i93.AuthOffLineDataSource>(),
          gh<_i62.AuthOnLineDataSource>(),
          gh<_i937.ForgotPasswordDataSources>(),
        ));
    gh.factory<_i973.LoginUseCase>(
        () => _i973.LoginUseCase(gh<_i218.AuthRepo>()));
    gh.factory<_i525.Register>(() => _i525.Register(gh<_i218.AuthRepo>()));
    gh.factory<_i997.ForgotUseCase>(
        () => _i997.ForgotUseCase(gh<_i218.AuthRepo>()));
    gh.factory<_i887.ForgotPasswordViewModel>(
        () => _i887.ForgotPasswordViewModel(gh<_i997.ForgotUseCase>()));
    gh.factory<_i384.LoginViewModel>(
        () => _i384.LoginViewModel(gh<_i973.LoginUseCase>()));
    return this;
  }
}
