import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/level_movie_entity.dart';

class LevelMapper {
  static LevelMovieEntity fromMap(Map<String, dynamic> map) {
    return LevelMovieEntity(
      id: int.parse(map['id']),
      name: map['name'],
    );
  }
}
