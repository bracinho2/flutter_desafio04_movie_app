import 'package:peabiru/peabiru.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_all_movies_usecase.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_movies_by_string_usecase.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/state/movies_state_page.dart';

// ignore: must_be_immutable
class MoviesStoreState extends StreamStore<Failure, IMoviesState> {
  final IGetAllMoviesUsecase _iGetAllMoviesUsecase;
  final IGetMoviesByStringUsecase _iGetMoviesByStringUsecase;

  MoviesStoreState(
    this._iGetAllMoviesUsecase,
    this._iGetMoviesByStringUsecase,
  ) : super(InitialState());

  Future<void> getAllMovies() async {
    setLoading(true);
    final response = await _iGetAllMoviesUsecase.getMovies();
    response.fold((error) {
      print(error.message);
    }, (movies) {
      update(
        DataState(
          movies: movies,
        ),
      );
    });
  }

  void filter(String value) {
    final currentState = state;

    if (currentState is InitialState) return;

    if (currentState is DataState) {
      final filtered = _iGetMoviesByStringUsecase.filterList(
          movies: currentState.movies, value: value);

      final state = currentState.copyWith(movies: filtered);
      FilteredState(filteredMovies: currentState.movies);

      update(FilteredState(filteredMovies: currentState.movies));
    }

    if (currentState is FilteredState) {
      final filtered = _iGetMoviesByStringUsecase.filterList(
          movies: currentState.filteredMovies, value: value);

      final state = currentState.copyWith(filteredMovies: filtered);
      update(state);
    }
  }
}
