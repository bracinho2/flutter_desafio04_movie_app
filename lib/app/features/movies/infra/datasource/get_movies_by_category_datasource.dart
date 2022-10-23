import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_entity.dart';

abstract class IGetMoviesByCategoryDatasource {
  Future<List<Map<String, dynamic>>> getMovies(
      {required CategoryEntity category});
}
