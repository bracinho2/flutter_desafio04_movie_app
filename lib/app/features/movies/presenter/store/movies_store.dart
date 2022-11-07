import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/snake_bar_manager/snake_bar_manager.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_all_movies_usecase.dart';
import 'package:peabiru/peabiru.dart';

class MoviesStore extends StreamStore<Failure, List<MovieEntity>> {
  final IGetAllMoviesUsecase _iGetAllMoviesUsecase;
  final SnakeBarManager _snakeBarManager;

  MoviesStore(
    this._iGetAllMoviesUsecase,
    this._snakeBarManager,
  ) : super([]);

  final List<MovieEntity> cachedMovies = [];

  Future<void> getAllMovies() async {
    setLoading(true);
    final response = await _iGetAllMoviesUsecase.getMovies();
    response.fold((l) {
      _snakeBarManager.showError(message: l.message);
    }, (r) {
      cachedMovies.clear();
      cachedMovies.addAll(r);
      update(r);
    });
  }

  void findMovie({required String filter}) {
    if (filter.isEmpty) {
      update(cachedMovies);
    } else {
      List<MovieEntity> tempList = cachedMovies
          .where((movie) => movie.name
              .toString()
              .toLowerCase()
              .contains(filter.toLowerCase()))
          .toList();

      update(tempList);
    }
  }
}
