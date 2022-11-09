import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';

abstract class IGetMoviesByStringUsecase {
  List<MovieEntity> filterList({
    required List<MovieEntity> movies,
    required String value,
  });
}

class GetMoviesByStringUsecaseImpl implements IGetMoviesByStringUsecase {
  @override
  List<MovieEntity> filterList({
    required List<MovieEntity> movies,
    required String value,
  }) {
    final filtered = movies
        .where((movie) =>
            movie.name.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();

    return filtered;
  }
}
