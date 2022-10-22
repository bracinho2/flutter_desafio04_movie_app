import 'package:flutter_desafio04_movie_app/app/features/movies/domain/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/repositories/movies_repository.dart';

abstract class IGetMovies {
  Future<List<MovieEntity>> call();
}

class GetMoviesImpl implements IGetMovies {
  final IMoviesRepository _iMoviesRepository;

  GetMoviesImpl(this._iMoviesRepository);
  @override
  Future<List<MovieEntity>> call() async {
    return _iMoviesRepository.getMovies();
  }
}
