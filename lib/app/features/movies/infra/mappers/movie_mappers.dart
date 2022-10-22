import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';

class MovieMapper {
  static MovieEntity fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      id: map['id'],
      name: map['name'],
      level: map['level'],
      evaluation: map['evaluation'],
      accent: map['accent'],
      imagePath: map['imagePath'],
      category: map['category'],
      favorite: map['favorite'],
    );
  }
}
