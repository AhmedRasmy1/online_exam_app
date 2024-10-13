import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import '../../../domain/common/api_result.dart';

import '../../../domain/common/CoustomExecption.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on TimeoutException catch (_) {
    return Fail(NoInternetError());
  } on DioException catch (ex) {
    log(ex as String);
    return Fail(DioHttpException(ex));
  } on IOException catch (_) {
    return Fail(NoInternetError());
  } on Exception catch (ex) {
    return Fail(ex);
  }
}
