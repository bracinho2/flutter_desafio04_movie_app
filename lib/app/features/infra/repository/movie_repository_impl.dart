import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/features/infra/datasource/movie_datasource.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/repositories/get_all_movies_repository.dart';

class GetAllMoviesRepositoryImpl implements IGetAllMoviesRepository {
  final IMovieDatasource _iMovieDatasource;

  GetAllMoviesRepositoryImpl(this._iMovieDatasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies() {
    // TODO: implement getMovies
    throw UnimplementedError();
  }
}
