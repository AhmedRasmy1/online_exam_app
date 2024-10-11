import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('bad Certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            response: dioException.response?.data,
            statusCode: dioException.response!.statusCode!);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was cancel');
      case DioExceptionType.connectionError:
        return ServerFailure('connection Error');
      case DioExceptionType.unknown:
        if(dioException.message!.contains('SocketException')){
          return ServerFailure('No EnterNet Connection ');
        }
        return ServerFailure('Opps Something error, TRY AGAIN');
      default:
        return ServerFailure('Opps Something error, TRY AGAIN');
    }
  }

  factory ServerFailure.fromResponse(
      {required int statusCode, required dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(' not found');
    } else if (statusCode == 429) {
      return ServerFailure('try tomorrow');
    } else if (statusCode == 500) {
      return ServerFailure('internal server error');
    } else {
      return ServerFailure('Opps Something error');
    }
  }
}