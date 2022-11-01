import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';

class MovieMapper {
  static MovieEntity fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      id: map['id'],
      name: map['original_title'],
      popularity: map['popularity'],
      evaluation: map['vote_average'],
      accent: map['original_language'],
      imagePath: map['poster_path'],
      category: CategoryEntity(id: 01, name: 'MinhaCategoria', selected: false),
      favorite: true,
      overview: map['overview'],
      releaseDate: toYear(map['release_date']),
    );
  }
}

bool toBoolean(String str, [bool strict = false]) {
  if (strict == true) {
    return str == '1' || str == 'true';
  }
  return str != '0' && str != 'false' && str != '';
}

String toYear(String string) {
  var substring = string.substring(0, 4);
  return substring;
}
