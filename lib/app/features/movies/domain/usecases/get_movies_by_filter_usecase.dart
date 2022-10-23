import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_movies_by_category_repository.dart';

abstract class IGetMoviesByCategoryUsecase {
  Future<Either<Failure, List<MovieEntity>>> getMovies(
      {required CategoryEntity category});
}

class GetMoviesByFilterUsecaseImpl implements IGetMoviesByCategoryUsecase {
  final IGetMoviesByCategoryRepository _iGetMoviesByFilterRepository;

  GetMoviesByFilterUsecaseImpl(this._iGetMoviesByFilterRepository);
  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies(
      {required CategoryEntity category}) async {
    return await _iGetMoviesByFilterRepository.getMovies(category: category);
  }
}
