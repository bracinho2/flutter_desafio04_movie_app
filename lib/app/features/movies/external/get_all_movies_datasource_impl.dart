import 'package:flutter_desafio04_movie_app/app/core/api/api_paths.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_all_movies_datasource.dart';
import 'package:peabiru/peabiru.dart';

class GetAllMoviesDatasourceImpl implements IGetAllMoviesDatasource {
  final HttpClientService _httpClient;

  GetAllMoviesDatasourceImpl(this._httpClient);
  @override
  Future<List<Map<String, dynamic>>> getMovies() async {
    try {
      final response = await _httpClient.fetch(path: URLS.MOVIES_BASE_URL);

      return response;
    } on UnoError catch (e, stackTrace) {
      if (e.response!.status == 404) {
        throw HttpClientError(message: 'O servidor não foi encontrado!');
      } else if (e.response!.status == 503) {
        throw HttpClientError(message: 'O servidor está fora do ar!');
      }
      throw HttpClientError(
          message: 'O servidor apresentou um problema', stackTrace: stackTrace);
    }
  }
}
