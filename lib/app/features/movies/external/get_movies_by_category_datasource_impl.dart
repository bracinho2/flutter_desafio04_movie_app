import 'package:flutter_desafio04_movie_app/app/core/dummy_data/dummy_data.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_movies_by_category_datasource.dart';
import 'package:uno/uno.dart';

class GetMoviesByCategoryDatasourceImpl
    implements IGetMoviesByCategoryDatasource {
  final HttpClientService _httpClient;

  GetMoviesByCategoryDatasourceImpl(this._httpClient);
  @override
  Future<List<Map<String, dynamic>>> getMovies(
      {required CategoryEntity category}) async {
    final urlBase = category.name;
    try {
      //final response = await _httpClient.fetch(path: urlBase);
      final response = dummyDataList;
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
