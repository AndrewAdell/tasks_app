import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get(
      {required String endPoint,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body}) async {
    var response =
        await dio.get(endPoint, options: Options(headers: headers), data: body);
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body}) async {
    var response = await dio.post(endPoint,
        options: Options(headers: headers), data: body);
    return response.data;
  }
}
