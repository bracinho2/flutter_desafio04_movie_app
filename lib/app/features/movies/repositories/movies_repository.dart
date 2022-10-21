import 'package:flutter_desafio04_movie_app/app/features/movies/domain/movies_entity.dart';

abstract class IMoviesRepository {
  Future<Movies> getMovies();
}
