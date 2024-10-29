import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';
import 'email_verification_view_state.dart';
import '../../../domain/entities/verify_code_entitie.dart';
import '../../../domain/use_cases/verifycode_usecase.dart';

@injectable
class VerifyCodeViewModel extends Cubit<VerifyCodeState> {
  final VerifyCodeUseCase _verifyCodeUseCase;

  VerifyCodeViewModel(this._verifyCodeUseCase) : super(InitialVerifyState());

  void verifyCode({required String code}) async {
    var result = await _verifyCodeUseCase.verifyCode(code);

    switch (result) {
      case Success<VerifyCodeEntities?>():
        {
          emit(VerifyCodeSuccess(result.data));
        }
      case Fail<VerifyCodeEntities?>():
        {
          emit(VerifyCodeError(result.exception));
        }
    }
  }
}
