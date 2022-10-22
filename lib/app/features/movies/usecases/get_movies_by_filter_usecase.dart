import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/repositories/get_by_filter_movies_repository.dart';

abstract class IGetMoviesByFilterUsecase {
  Future<Either<Failure, List<MovieEntity>>> getMovies();
}

class GetMoviesByFilterUsecaseImpl implements IGetMoviesByFilterUsecase {
  final IGetMoviesByFilterRepository _iGetMoviesByFilterRepository;

  GetMoviesByFilterUsecaseImpl(this._iGetMoviesByFilterRepository);
  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies() async {
    return await _iGetMoviesByFilterRepository.getMovies();
  }
}
