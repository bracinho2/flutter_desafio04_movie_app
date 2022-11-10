import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';

abstract class IMoviesState {}

class InitialState extends IMoviesState {}

class DataState extends IMoviesState {
  final List<MovieEntity> movies;

  DataState({
    required this.movies,
  });

  DataState copyWith({
    List<MovieEntity>? movies,
  }) {
    return DataState(
      movies: movies ?? this.movies,
    );
  }
}

class FilteredState extends IMoviesState {
  final List<MovieEntity> filteredMovies;

  FilteredState({
    required this.filteredMovies,
  });

  FilteredState copyWith({
    List<MovieEntity>? filteredMovies,
  }) {
    return FilteredState(
      filteredMovies: filteredMovies ?? this.filteredMovies,
    );
  }
}
