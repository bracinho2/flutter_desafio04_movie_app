import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/level_movie_entity.dart';

class MovieEntity {
  final int id;
  final String name;
  final LevelMovieEntity level;
  final CategoryEntity category;
  final double evaluation;
  final String accent;
  final String imagePath;
  final bool favorite;

  MovieEntity({
    required this.id,
    required this.name,
    required this.level,
    required this.evaluation,
    required this.accent,
    required this.imagePath,
    required this.category,
    required this.favorite,
  });

  @override
  String toString() =>
      'Movie > id: $id, name: $name, category: $category, level: $level, evaluation: $evaluation, accent: $accent, imagePath: $imagePath, favorite: $favorite';
}
