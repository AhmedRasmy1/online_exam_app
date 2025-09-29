// dart format width=80
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
import '../Features/explore/data/data_sources/exams_data_source.dart' as _i1013;
import '../Features/explore/data/data_sources/subjects_source.dart' as _i832;
import '../Features/explore/data/data_sources_impl/exams_data_source_impl.dart'
    as _i692;
import '../Features/explore/data/data_sources_impl/subject_source_impl.dart'
    as _i352;
import '../Features/explore/data/repository/exams_repo_impl.dart' as _i436;
import '../Features/explore/data/repository/subjects_repo_impl.dart' as _i366;
import '../Features/explore/domain/repositores/exams_repo.dart' as _i936;
import '../Features/explore/domain/repositores/subjects_repo.dart' as _i21;
import '../Features/explore/domain/use_cases/exams_use_case.dart' as _i785;
import '../Features/explore/domain/use_cases/subjects_use_case.dart' as _i767;
import '../Features/explore/presentation/view_molde/exams_view_model.dart/exams_cubit.dart'
    as _i391;
import '../Features/explore/presentation/view_molde/subjects_view_model/subjects_cubit.dart'
    as _i313;
import '../Features/profile/data/data_sources/profile_data_sources.dart'
    as _i775;
import '../Features/profile/data/data_sources_impl/profile_data_source_impl.dart'
    as _i661;
import '../Features/profile/data/repositories/profile_repo_impl.dart' as _i1031;
import '../Features/profile/domain/repositories/profile_repo.dart' as _i413;
import '../Features/profile/domain/use_cases/change_password_use_case.dart'
    as _i396;
import '../Features/profile/domain/use_cases/edit_profile_use_case.dart'
    as _i734;
import '../Features/profile/presentation/view_model/change_password_view_model/change_password_cubit.dart'
    as _i594;
import '../Features/profile/presentation/view_model/edit_profile_view_model/edit_profile_cubit.dart'
    as _i830;
import '../Features/questions/data/data_sources/question_data_source.dart'
    as _i396;
import '../Features/questions/data/data_sources_impl/question_data_source_impl.dart'
    as _i980;
import '../Features/questions/data/question_repo_impl/question_repo_impl.dart'
    as _i1023;
import '../Features/questions/domian/questions_repo/question_repo.dart'
    as _i703;
import '../Features/questions/domian/use_cases/question_use_case.dart' as _i840;
import '../Features/questions/presentation/view_model/questions_view_model/questions_cubit.dart'
    as _i868;

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
    gh.factory<_i1013.ExamsDataSource>(
        () => _i692.ExamsDataSourceImpl(gh<_i108.ApiManager>()));
    gh.factory<_i396.QuestionDataSource>(
        () => _i980.QuestionDataSourceImpl(gh<_i108.ApiManager>()));
    gh.factory<_i245.AuthOnLineDataSource>(
        () => _i102.AuthOnLineDataSourceImpl(gh<_i108.ApiManager>()));
    gh.factory<_i775.ProfileDataSources>(
        () => _i661.ProfileDataSourceImpl(gh<_i108.ApiManager>()));
    gh.factory<_i703.QuestionRepo>(
        () => _i1023.QuestionRepoImpl(gh<_i396.QuestionDataSource>()));
    gh.factory<_i832.SubjectsSource>(
        () => _i352.SubjectSourceImpl(gh<_i108.ApiManager>()));
    gh.factory<_i840.QuestionUseCase>(
        () => _i840.QuestionUseCase(gh<_i703.QuestionRepo>()));
    gh.factory<_i936.ExamsRepo>(
        () => _i436.ExamsRepoImpl(gh<_i1013.ExamsDataSource>()));
    gh.factory<_i785.ExamsUseCase>(
        () => _i785.ExamsUseCase(gh<_i936.ExamsRepo>()));
    gh.factory<_i297.AuthRepo>(() => _i129.AuthRepoImpl(
          gh<_i604.AuthOffLineDataSource>(),
          gh<_i245.AuthOnLineDataSource>(),
        ));
    gh.factory<_i413.ProfileRepo>(
        () => _i1031.ProfileRepoImpl(gh<_i775.ProfileDataSources>()));
    gh.factory<_i21.SubjectsRepo>(
        () => _i366.SubjectsRepoImpl(gh<_i832.SubjectsSource>()));
    gh.factory<_i868.QuestionsCubit>(
        () => _i868.QuestionsCubit(gh<_i840.QuestionUseCase>()));
    gh.factory<_i391.ExamsCubit>(
        () => _i391.ExamsCubit(gh<_i785.ExamsUseCase>()));
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
    gh.factory<_i767.SubjectsUseCase>(
        () => _i767.SubjectsUseCase(gh<_i21.SubjectsRepo>()));
    gh.factory<_i357.RigesterViewModel>(
        () => _i357.RigesterViewModel(gh<_i1052.RegisterUseCase>()));
    gh.factory<_i313.SubjectsCubit>(
        () => _i313.SubjectsCubit(gh<_i767.SubjectsUseCase>()));
    gh.factory<_i396.ChangePasswordUseCase>(
        () => _i396.ChangePasswordUseCase(gh<_i413.ProfileRepo>()));
    gh.factory<_i734.EditProfileUseCase>(
        () => _i734.EditProfileUseCase(gh<_i413.ProfileRepo>()));
    gh.factory<_i444.VerifyCodeViewModel>(
        () => _i444.VerifyCodeViewModel(gh<_i745.VerifyCodeUseCase>()));
    gh.factory<_i830.EditProfileCubit>(
        () => _i830.EditProfileCubit(gh<_i734.EditProfileUseCase>()));
    gh.factory<_i1.ResetPasswordViewModel>(
        () => _i1.ResetPasswordViewModel(gh<_i64.ResetPasswordUseCase>()));
    gh.factory<_i594.ChangePasswordCubit>(
        () => _i594.ChangePasswordCubit(gh<_i396.ChangePasswordUseCase>()));
    return this;
  }
}
