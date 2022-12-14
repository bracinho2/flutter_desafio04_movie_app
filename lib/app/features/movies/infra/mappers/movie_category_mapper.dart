import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_movie_entity.dart';

class CategoryMapper {
  static CategoryEntity fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
      id: int.parse(map['id']),
      name: map['name'],
      selected: toBoolean(map['selected']),
    );
  }
}

bool toBoolean(String str, [bool strict = false]) {
  if (strict == true) {
    return str == '1' || str == 'true';
  }
  return str != '0' && str != 'false' && str != '';
}
