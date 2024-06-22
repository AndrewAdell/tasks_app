import 'package:dio/dio.dart';

abstract class Failures {
  String errormessage;
  Failures(this.errormessage);
}

class ServerFailures extends Failures {
  ServerFailures(super.errormessage);

  factory ServerFailures.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailures('send time out with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailures('receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailures('bad Certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailures('bad response with ApiServer');
      case DioExceptionType.cancel:
        return ServerFailures('Your request to the server was canceld');
      case DioExceptionType.connectionError:
        return ServerFailures('there is no internet please try later!');
      case DioExceptionType.unknown:
        return ServerFailures('UnKnown exeption ');
      default:
        return ServerFailures('Oops there was an error,please try again');
    }
  }
}
