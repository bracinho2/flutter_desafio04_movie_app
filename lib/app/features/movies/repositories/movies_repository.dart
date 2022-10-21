import 'package:flutter_desafio04_movie_app/app/features/movies/domain/movie_entity.dart';

abstract class IMoviesRepository {
  Future<List<MovieEntity>> getMovies();
}
