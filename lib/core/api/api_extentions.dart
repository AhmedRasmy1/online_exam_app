import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import '../../Features/Auth/domain/common/api_result.dart';

import '../../Features/Auth/domain/common/coustom_execption.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on TimeoutException catch (_) {
    return Fail(NoInternetError());
  } on DioException catch (ex) {
    if (ex.response != null) {
      return Fail(ServerError(
        ex.response?.statusCode,
        ex.response?.data['message'] ?? "Unexpected error",
      ));
    } else {
      return Fail(DioHttpException(ex));
    }
  } on IOException catch (_) {
    return Fail(NoInternetError());
  } on Exception catch (ex) {
    return Fail(ex);
  }
}
