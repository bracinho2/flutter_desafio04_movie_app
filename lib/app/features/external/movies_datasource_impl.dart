import 'package:dio/dio.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:flutter_desafio04_movie_app/app/features/infra/datasource/movie_datasource.dart';

class MoviesDatasourceImpl implements IMovieDatasource {
  final HttpClient _httpClient;

  MoviesDatasourceImpl(this._httpClient);
  @override
  Future<List<Map<String, dynamic>>> call() async {
    try {
      final response = await _httpClient.fetch(path: 'path');
      return [response];
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
