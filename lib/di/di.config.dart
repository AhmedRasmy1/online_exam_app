// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../Features/Auth/data/api/api_manager.dart' as _i203;
import '../Features/Auth/data/data_sources/auth_offline_datasource.dart'
    as _i93;
import '../Features/Auth/data/data_sources/auth_online_datasource.dart' as _i62;
import '../Features/Auth/data/data_sources/fotgot_password_datasource.dart'
    as _i937;
import '../Features/Auth/data/data_sources/reset_password_datasource.dart'
    as _i362;
import '../Features/Auth/data/data_sources/verify_codel_datasource.dart'
    as _i258;
import '../Features/Auth/data/data_source_impl/auth_offline_datasoure_impl.dart'
    as _i626;
import '../Features/Auth/data/data_source_impl/auth_online_datasource_impl.dart'
    as _i127;
import '../Features/Auth/data/data_source_impl/fotgot_password_datasource_impl.dart'
    as _i116;
import '../Features/Auth/data/data_source_impl/reset_password_datasource_impl.dart'
    as _i121;
import '../Features/Auth/data/data_source_impl/verify_codel_datasource_impl.dart'
    as _i1058;
import '../Features/Auth/data/repositories_impl/auth_repo_impl.dart' as _i602;
import '../Features/Auth/domain/repositories/auth_repo.dart' as _i218;
import '../Features/Auth/domain/use_cases/forgot_password_usecase.dart'
    as _i997;
import '../Features/Auth/domain/use_cases/login_usecase.dart' as _i973;
import '../Features/Auth/domain/use_cases/register_usecase.dart' as _i525;
import '../Features/Auth/domain/use_cases/reset_password_usecase.dart' as _i663;
import '../Features/Auth/domain/use_cases/verifycode_usecase.dart' as _i236;
import '../Features/Auth/presentation/view_model/EmailVerification_ViewModel/email_verification_view_cubit.dart'
    as _i444;
import '../Features/Auth/presentation/view_model/ForgetPasswordPage_viewModel/forget_password_view_cubit.dart'
    as _i4;
import '../Features/Auth/presentation/view_model/LoginPage_ViewModel/login_view_cubit.dart'
    as _i964;
import '../Features/Auth/presentation/view_model/Resetpage_ViewModel/reset_password_view_cubit.dart'
    as _i1;
import '../Features/Auth/presentation/view_model/SigninPage_ViewModel/signin_view_cubit.dart'
    as _i357;

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
    gh.factory<_i362.ResetPasswordDataSource>(
        () => _i121.ResetPasswordDatasourceImpl(gh<_i203.ApiManager>()));
    gh.factory<_i62.AuthOnLineDataSource>(
        () => _i127.AuthOnLineDataSourceImpl(gh<_i203.ApiManager>()));
    gh.factory<_i937.ForgotPasswordDataSources>(
        () => _i116.ForgotPasswordDatasource(gh<_i203.ApiManager>()));
    gh.factory<_i258.VerifyCodeDataSource>(
        () => _i1058.VerifyCodeDatasourceImpl(gh<_i203.ApiManager>()));
    gh.factory<_i218.AuthRepo>(() => _i602.AuthRepoImpl(
          gh<_i93.AuthOffLineDataSource>(),
          gh<_i62.AuthOnLineDataSource>(),
          gh<_i937.ForgotPasswordDataSources>(),
          gh<_i258.VerifyCodeDataSource>(),
          gh<_i362.ResetPasswordDataSource>(),
        ));
    gh.factory<_i997.ForgotUseCase>(
        () => _i997.ForgotUseCase(gh<_i218.AuthRepo>()));
    gh.factory<_i973.LoginUseCase>(
        () => _i973.LoginUseCase(gh<_i218.AuthRepo>()));
    gh.factory<_i525.RegisterUseCase>(
        () => _i525.RegisterUseCase(gh<_i218.AuthRepo>()));
    gh.factory<_i663.ResetPasswordUseCase>(
        () => _i663.ResetPasswordUseCase(gh<_i218.AuthRepo>()));
    gh.factory<_i236.VerifyCodeUseCase>(
        () => _i236.VerifyCodeUseCase(gh<_i218.AuthRepo>()));
    gh.factory<_i357.RigesterViewModel>(
        () => _i357.RigesterViewModel(gh<_i525.RegisterUseCase>()));
    gh.factory<_i1.ResetPasswordViewModel>(
        () => _i1.ResetPasswordViewModel(gh<_i663.ResetPasswordUseCase>()));
    gh.factory<_i4.ForgotPasswordViewModel>(
        () => _i4.ForgotPasswordViewModel(gh<_i997.ForgotUseCase>()));
    gh.factory<_i444.VerifyCodeViewModel>(
        () => _i444.VerifyCodeViewModel(gh<_i236.VerifyCodeUseCase>()));
    gh.factory<_i964.LoginViewModel>(
        () => _i964.LoginViewModel(gh<_i973.LoginUseCase>()));
    return this;
  }
}
