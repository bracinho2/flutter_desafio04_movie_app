import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_movie_entity.dart';

class MovieEntity {
  final int id;
  final String name;
  final double popularity;
  final CategoryEntity category;
  final double evaluation;
  final String accent;
  final String imagePath;
  final bool favorite;
  final String overview;
  final String releaseDate;

  MovieEntity(
      {required this.id,
      required this.name,
      required this.popularity,
      required this.evaluation,
      required this.accent,
      required this.imagePath,
      required this.category,
      required this.favorite,
      required this.overview,
      required this.releaseDate});

  @override
  String toString() =>
      'Movie > id: $id, name: $name, category: $category, popularity: $popularity, evaluation: $evaluation, accent: $accent, imagePath: $imagePath, favorite: $favorite, release date: $releaseDate';
}
