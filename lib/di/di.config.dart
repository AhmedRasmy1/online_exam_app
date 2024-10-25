// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../Features/Auth/data/data_source_impl/auth_offline_datasoure_impl.dart'
    as _i366;
import '../Features/Auth/data/data_source_impl/auth_online_datasource_impl.dart'
    as _i102;
import '../Features/Auth/data/data_sources/auth_offline_datasource.dart'
    as _i604;
import '../Features/Auth/data/data_sources/auth_online_datasource.dart'
    as _i245;
import '../Features/Auth/data/repositories_impl/auth_repo_impl.dart' as _i129;
import '../Features/Auth/domain/repositories/auth_repo.dart' as _i297;
import '../Features/Auth/domain/use_cases/forgot_password_usecase.dart'
    as _i573;
import '../Features/Auth/domain/use_cases/login_usecase.dart' as _i745;
import '../Features/Auth/domain/use_cases/register_usecase.dart' as _i1052;
import '../Features/Auth/domain/use_cases/reset_password_usecase.dart' as _i64;
import '../Features/Auth/domain/use_cases/verifycode_usecase.dart' as _i745;
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
import '../Features/profile/data/data_sources/change_password_data_sources.dart'
    as _i258;
import '../Features/profile/data/data_sources_impl/change_password_data_sources_impl.dart'
    as _i421;
import '../Features/profile/data/repositories/change_password_repo_impl.dart'
    as _i748;
import '../Features/profile/domain/repositories/change_password_repo.dart'
    as _i519;
import '../Features/profile/domain/use_cases/change_password_use_case.dart'
    as _i396;
import '../Features/profile/presentation/view_model/change_password_cubit.dart'
    as _i372;

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
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i604.AuthOffLineDataSource>(
        () => _i366.AuthOffLineDataSourceImpl());
    gh.factory<_i258.ChangePasswordDataSources>(
        () => _i421.ChangePasswordDataSourcesImpl(gh<_i108.ApiManager>()));
    gh.factory<_i245.AuthOnLineDataSource>(
        () => _i102.AuthOnLineDataSourceImpl(gh<_i108.ApiManager>()));
    gh.factory<_i519.ChangePasswordRepo>(() =>
        _i748.ChangePasswordRepoImpl(gh<_i258.ChangePasswordDataSources>()));
    gh.factory<_i297.AuthRepo>(() => _i129.AuthRepoImpl(
          gh<_i604.AuthOffLineDataSource>(),
          gh<_i245.AuthOnLineDataSource>(),
        ));
    gh.factory<_i396.ChangePasswordUseCase>(
        () => _i396.ChangePasswordUseCase(gh<_i519.ChangePasswordRepo>()));
    gh.factory<_i573.ForgotUseCase>(
        () => _i573.ForgotUseCase(gh<_i297.AuthRepo>()));
    gh.factory<_i745.LoginUseCase>(
        () => _i745.LoginUseCase(gh<_i297.AuthRepo>()));
    gh.factory<_i1052.RegisterUseCase>(
        () => _i1052.RegisterUseCase(gh<_i297.AuthRepo>()));
    gh.factory<_i64.ResetPasswordUseCase>(
        () => _i64.ResetPasswordUseCase(gh<_i297.AuthRepo>()));
    gh.factory<_i745.VerifyCodeUseCase>(
        () => _i745.VerifyCodeUseCase(gh<_i297.AuthRepo>()));
    gh.factory<_i4.ForgotPasswordViewModel>(
        () => _i4.ForgotPasswordViewModel(gh<_i573.ForgotUseCase>()));
    gh.factory<_i964.LoginViewModel>(
        () => _i964.LoginViewModel(gh<_i745.LoginUseCase>()));
    gh.factory<_i357.RigesterViewModel>(
        () => _i357.RigesterViewModel(gh<_i1052.RegisterUseCase>()));
    gh.factory<_i372.ChangePasswordCubit>(
        () => _i372.ChangePasswordCubit(gh<_i396.ChangePasswordUseCase>()));
    gh.factory<_i444.VerifyCodeViewModel>(
        () => _i444.VerifyCodeViewModel(gh<_i745.VerifyCodeUseCase>()));
    gh.factory<_i1.ResetPasswordViewModel>(
        () => _i1.ResetPasswordViewModel(gh<_i64.ResetPasswordUseCase>()));
    return this;
  }
}
