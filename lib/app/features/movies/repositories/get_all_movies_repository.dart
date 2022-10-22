import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/movie_entity.dart';

abstract class IGetAllMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getMovies();
}
