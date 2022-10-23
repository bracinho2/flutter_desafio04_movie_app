import 'package:dio/dio.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_movies_by_string_datasource.dart';

class GetMoviesByStringDatasourceImpl implements IGetMoviesByStringDatasource {
  final HttpClientService _httpClient;

  GetMoviesByStringDatasourceImpl(this._httpClient);
  @override
  Future<List<Map<String, dynamic>>> getMovies({required String value}) async {
    final urlBase = value;
    try {
      final response = await _httpClient.fetch(path: urlBase);
      return response;
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
