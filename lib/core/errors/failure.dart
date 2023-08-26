import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  Failure({required this.error});
}

class ServerFailure extends Failure {
  ServerFailure({required super.error});

  factory ServerFailure.fromDioException({required DioException dioException}) {
    switch (dioException.error) {
      case DioExceptionType.connectionError:
        if (dioException.error.toString().contains('SocketExceptions')) {
          return ServerFailure(error: 'There is no internet connection');
        }
        return ServerFailure(error: 'There was connection error');
      case DioExceptionType.sendTimeout:
        return ServerFailure(error: 'Send time out');
      case DioExceptionType.connectionTimeout:
        return ServerFailure(error: 'Connection time out');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(error: 'Receive time out');
      case DioExceptionType.unknown:
        return ServerFailure(error: 'Unknown error, please try again later');
      case DioExceptionType.cancel:
        return ServerFailure(error: 'Request to api server was canceled');
      case DioExceptionType.badResponse:
        return ServerFailure.badResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.badCertificate:
        return ServerFailure(error: 'Bad certificate error, try again later');
      default:
        return ServerFailure(
            error: 'Ops There was an error, please try again later');
    }
  }

  factory ServerFailure.badResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(error: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          error: 'Your request not found, please try again later');
    } else if (statusCode == 500) {
      return ServerFailure(
          error: 'There was an error from server, please try again later');
    } else {
      return ServerFailure(
          error: 'Ops There was an error, please try again later');
    }
  }
}
