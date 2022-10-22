import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_all_movies_datasource.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/mappers/movie_mappers.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_all_movies_repository.dart';

class GetAllMoviesRepositoryImpl implements IGetAllMoviesRepository {
  final IGetAllMoviesDatasource _iGetAllMoviesDatasource;

  GetAllMoviesRepositoryImpl(this._iGetAllMoviesDatasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies() async {
    try {
      final response = await _iGetAllMoviesDatasource.getMovies();

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
