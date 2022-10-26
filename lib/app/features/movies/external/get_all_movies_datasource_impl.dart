import 'package:dio/dio.dart';
import 'package:flutter_desafio04_movie_app/app/core/dummy_data/dummy_data.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_all_movies_datasource.dart';

class GetAllMoviesDatasourceImpl implements IGetAllMoviesDatasource {
  final HttpClientService _httpClient;

  GetAllMoviesDatasourceImpl(this._httpClient);
  @override
  Future<List<Map<String, dynamic>>> getMovies() async {
    try {
      //final response = await _httpClient.fetch(path: 'path');
      final response = dummyDataList;
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
