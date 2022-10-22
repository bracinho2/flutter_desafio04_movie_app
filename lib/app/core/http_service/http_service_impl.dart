import 'package:dio/dio.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';

class DioHttpClientImpl implements HttpClient {
  final Dio _dio;

  DioHttpClientImpl(this._dio);
  @override
  Future<Map<String, dynamic>> fetch({required String path}) async {
    try {
      final response = await _dio.get(path);
      final values = response.data;
      return values;
    } on DioError catch (e, stackTrace) {
      if (e.response!.statusCode == 404) {
        throw HttpClientError(message: 'O servidor não foi encontrado!');
      } else if (e.response!.statusCode == 503) {
        throw HttpClientError(message: 'O servidor está fora do ar!');
      }
      throw HttpClientError(
          message: 'O servidor apresentou um problema', stackTrace: stackTrace);
    }
  }
}
