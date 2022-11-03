import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_movies_by_string_datasource.dart';
import 'package:peabiru/peabiru.dart';

class GetMoviesByStringDatasourceImpl implements IGetMoviesByStringDatasource {
  final HttpClientService _httpClient;

  GetMoviesByStringDatasourceImpl(this._httpClient);
  @override
  Future<List<Map<String, dynamic>>> getMovies({required String value}) async {
    final urlBase = value;
    try {
      final response = await _httpClient.fetch(path: urlBase);
      //final response = dummyDataList;
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
