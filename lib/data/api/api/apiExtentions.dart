
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_exam_app/domain/common/api_result.dart';

import '../../../domain/common/CoustomExecption.dart';

Future<Result<T>> executeApi<T>(Future<T> Function ()apiCall)async{
  try{
    var result=await apiCall.call();
    return Success(result);
  }on TimeoutException catch(ex){
    return Fail(NoInternetError());
  }on DioException catch(ex){
    return Fail(DioHttpException(ex));
  }on IOException catch(ex){
    return Fail(NoInternetError());

  }on Exception catch(ex){
    return Fail(ex);
  }
}