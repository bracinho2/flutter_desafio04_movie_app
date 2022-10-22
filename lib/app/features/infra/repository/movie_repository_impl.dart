import 'package:flutter_desafio04_movie_app/app/features/infra/datasource/movie_datasource.dart';
import 'package:flutter_desafio04_movie_app/app/features/infra/mappers/movie_mappers.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/repositories/movies_repository.dart';

class MovieRepositoryImpl implements IMoviesRepository {
  final IMovieDatasource _iMovieDatasource;

  MovieRepositoryImpl(this._iMovieDatasource);

  @override
  Future<List<MovieEntity>> getMovies() async {
    final response = await _iMovieDatasource.call();

    final values = response.map(MovieMapper.fromMap).toList();

    return values as List<MovieEntity>;
  }
}
