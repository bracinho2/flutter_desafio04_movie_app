import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_movies_by_string_repository.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_movies_by_string_datasource.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/mappers/movie_mappers.dart';

class GetMoviesByStringRepositoryImpl implements IGetMoviesByStringRepository {
  final IGetMoviesByStringDatasource _iGetAllMoviesDatasource;

  GetMoviesByStringRepositoryImpl(this._iGetAllMoviesDatasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies(
      {required String value}) async {
    try {
      final response = await _iGetAllMoviesDatasource.getMovies(value: value);

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
