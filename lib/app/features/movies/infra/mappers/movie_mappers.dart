import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/mappers/movie_category_mapper.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/mappers/movie_level_mapper.dart';

class MovieMapper {
  static MovieEntity fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      id: int.parse(map['id']),
      name: map['name'],
      level: LevelMapper.fromMap(map['level']),
      evaluation: double.parse(map['evaluation']),
      accent: map['accent'],
      imagePath: map['imagePath'],
      category: CategoryMapper.fromMap(map['category']),
      favorite: toBoolean(map['favorite']),
    );
  }
}

bool toBoolean(String str, [bool strict = false]) {
  if (strict == true) {
    return str == '1' || str == 'true';
  }
  return str != '0' && str != 'false' && str != '';
}
