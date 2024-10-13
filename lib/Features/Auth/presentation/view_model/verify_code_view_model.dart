
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/data/api/api/model/verify_code_model.dart';
import 'package:online_exam_app/domain/common/api_result.dart';
import 'package:online_exam_app/domain/entities/verify_code_entitie.dart';
import 'package:online_exam_app/domain/use_cases/verifycode_usecase.dart';

class VerifyCodeViewModel extends Cubit<VerifyCodeState>{
  VerifyCodeUseCase verifyCodeUseCase;

  VerifyCodeViewModel(this.verifyCodeUseCase) : super(InitialState());


  void verifyCode({required String code})async{
    var result=await verifyCodeUseCase.verifyCode(code);

    switch (result) {
      case Success<VerifyCodeEntities?>():{

        emit( VerifyCodeSuccess(result.data));
      }
      case Fail<VerifyCodeEntities?>():{
        emit(VerifyCodeError(result.exception));

      }

    }

  }


}




sealed class VerifyCodeState {}
class InitialState extends VerifyCodeState{}
class VerifyCodeSuccess extends VerifyCodeState {
  VerifyCodeEntities? verifyCodeEntities;

  VerifyCodeSuccess(this.verifyCodeEntities);
}

class VerifyCodeLoading extends VerifyCodeState {}

class VerifyCodeError extends VerifyCodeState {
  Exception? exception;

  VerifyCodeError(this.exception);
}
