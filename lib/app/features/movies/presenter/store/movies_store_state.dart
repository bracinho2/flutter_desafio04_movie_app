import 'package:peabiru/peabiru.dart';

import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_all_movies_usecase.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_movies_by_string_usecase.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/state/movies_state_page.dart';

// ignore: must_be_immutable
class MoviesStoreState extends StreamStore<Failure, IMoviesState> {
  final IMoviesState state;
  final IGetAllMoviesUsecase _iGetAllMoviesUsecase;
  final IGetMoviesByStringUsecase _iGetMoviesByStringUsecase;

  MoviesStoreState(
    this.state,
    this._iGetAllMoviesUsecase,
    this._iGetMoviesByStringUsecase,
  ) : super(state);

  Future<void> getAllMovies() async {
    setLoading(true);
    final response = await _iGetAllMoviesUsecase.getMovies();
    response.fold((error) {
      print(error.message);
    }, (movies) {
      update(
        DataState(allMovies: movies),
      );
    });
  }

  void filter(String value) {
    final currentState = state;
    if (currentState is InitialState) return;
    if (currentState is DataState) return;
    if (currentState is FilteredState) return;
  }
}
