import 'package:flutter_desafio04_movie_app/app/features/movies/domain/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/repositories/get_by_string_movies_repository.dart';

abstract class IGetMoviesByStringUsecase {
  Future<Either<Failure, List<MovieEntity>>> getMovies();
}

class GetMoviesByStringUsecaseImpl implements IGetMoviesByStringUsecase {
  final IGetMoviesByStringRepository _iGetMoviesByStringRepository;

  GetMoviesByStringUsecaseImpl(this._iGetMoviesByStringRepository);
  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies() async {
    return await _iGetMoviesByStringRepository.getMovies();
  }
}
