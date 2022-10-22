import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_by_string_movies_repository.dart';

abstract class IGetMoviesByStringUsecase {
  Future<Either<Failure, List<MovieEntity>>> getMovies({required String value});
}

class GetMoviesByStringUsecaseImpl implements IGetMoviesByStringUsecase {
  final IGetMoviesByStringRepository _iGetMoviesByStringRepository;

  GetMoviesByStringUsecaseImpl(this._iGetMoviesByStringRepository);
  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies({
    required String value,
  }) async {
    if (value.isEmpty) {
      return Left(UsecaseError(message: 'Digite o nome do filme'));
    }
    return await _iGetMoviesByStringRepository.getMovies(value: value);
  }
}
