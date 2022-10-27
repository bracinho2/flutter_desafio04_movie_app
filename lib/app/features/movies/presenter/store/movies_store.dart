import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_all_movies_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class MoviesStore extends StreamStore<Failure, List<MovieEntity>> {
  final IGetAllMoviesUsecase _iGetAllMoviesUsecase;

  MoviesStore(
    this._iGetAllMoviesUsecase,
  ) : super([]);

  Future<void> getAllMovies() async {
    setLoading(true);
    final response = await _iGetAllMoviesUsecase.getMovies();
    response.fold((l) => null, (r) {
      update(r);
      print(r);
    });
  }
}
