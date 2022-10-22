import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';

abstract class IGetMoviesByFilterDatasource {
  Future<List<Map<String, dynamic>>> getMovies();
}
