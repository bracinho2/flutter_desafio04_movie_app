import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';

abstract class IMoviesState {}

class InitialState extends IMoviesState {}

class DataState extends IMoviesState {
  final List<MovieEntity> allMovies;

  DataState({
    required this.allMovies,
  });
}

class FilteredState extends IMoviesState {
  final List<MovieEntity> filteredMovies;

  FilteredState({
    required this.filteredMovies,
  });
}
