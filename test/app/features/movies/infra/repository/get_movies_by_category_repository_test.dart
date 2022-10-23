import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_movies_by_category_repository.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_movies_by_category_datasource.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/repository/get_movies_by_category_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetMoviesByCategoryMock extends Mock
    implements IGetMoviesByCategoryDatasource {}

void main() {
  late IGetMoviesByCategoryDatasource datasource;
  late IGetMoviesByCategoryRepository repository;

  setUp(() {
    datasource = GetMoviesByCategoryMock();
    repository = GetMoviesByCategoryRepositoryImpl(datasource);
  });

  final category = CategoryEntity(id: 01, name: 'name');

  List<Map<String, dynamic>> dummyList = [
    {
      "id": "01",
      "name": "01",
      "level": {"id": "01", "name": "name"},
      "category": {"id": "01", "name": "name"},
      "evaluation": "01",
      "accent": "01",
      "imagePath": "01",
      "favorite": "true"
    },
    {
      "id": "01",
      "name": "01",
      "level": {"id": "01", "name": "name"},
      "category": {"id": "01", "name": "name"},
      "evaluation": "01",
      "accent": "01",
      "imagePath": "01",
      "favorite": "true"
    }
  ];

  test('Repository:GETMOVIESBYCATEGORY > should return movie list not null',
      () async {
    when(
      () => datasource.getMovies(category: category),
    ).thenAnswer((_) async => dummyList);

    final response = await repository.getMovies(category: category);

    expect(response, isNotNull);
  });

  test(
      'Repository:GETMOVIESBYCATEGORY > should return a list from Movie Entity per category',
      () async {
    when(
      () => datasource.getMovies(category: category),
    ).thenAnswer((_) async => (dummyList));

    final response = await repository.getMovies(category: category);

    expect(response.fold((l) => l, (r) => r), isA<List<MovieEntity>>());
  });

  tearDown(() {
    repository;
    datasource;
  });
}
