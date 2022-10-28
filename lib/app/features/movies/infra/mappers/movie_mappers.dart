import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/level_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/mappers/movie_category_mapper.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/mappers/movie_level_mapper.dart';

class MovieMapper {
  static MovieEntity fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      id: 01,
      name: 'teste',
      level: LevelMovieEntity(id: 01, name: 'MeuNivel'),
      evaluation: 9.5,
      accent: 'us',
      imagePath:
          'https://images.unsplash.com/photo-1606963301478-7fde687285d6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      category: CategoryEntity(id: 01, name: 'MinhaCategoria', selected: false),
      favorite: true,
    );
  }
}

bool toBoolean(String str, [bool strict = false]) {
  if (strict == true) {
    return str == '1' || str == 'true';
  }
  return str != '0' && str != 'false' && str != '';
}
