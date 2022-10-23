import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_movies_by_category_repository.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_movies_by_category_datasource.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/mappers/movie_mappers.dart';

class GetMoviesByCategoryRepositoryImpl
    implements IGetMoviesByCategoryRepository {
  final IGetMoviesByCategoryDatasource _iGetMoviesByCategoryDatasource;

  GetMoviesByCategoryRepositoryImpl(this._iGetMoviesByCategoryDatasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies(
      {required CategoryEntity category}) async {
    try {
      final response =
          await _iGetMoviesByCategoryDatasource.getMovies(category: category);

      final values = response.map((map) => MovieMapper.fromMap(map)).toList();

      return Right(values);
    } on Failure catch (e, stackTrace) {
      return Left(HttpClientError(
        message: e.message,
        stackTrace: stackTrace,
      ));
    }
  }
}
