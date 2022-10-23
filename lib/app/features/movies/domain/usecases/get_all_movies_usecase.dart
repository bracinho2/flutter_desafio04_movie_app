import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_all_movies_repository.dart';

abstract class IGetAllMoviesUsecase {
  Future<Either<Failure, List<MovieEntity>>> getMovies();
}

class GetAllMoviesImpl implements IGetAllMoviesUsecase {
  final IGetAllMoviesRepository _iMoviesRepository;

  GetAllMoviesImpl(this._iMoviesRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies() async {
    return await _iMoviesRepository.getMovies();
  }
}
