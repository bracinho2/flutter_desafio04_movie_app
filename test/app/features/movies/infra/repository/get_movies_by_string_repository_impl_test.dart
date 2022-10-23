import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_movies_by_string_repository.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_movies_by_string_datasource.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/repository/get_movies_by_string_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetMoviesByStringMock extends Mock
    implements IGetMoviesByStringDatasource {}

void main() {
  late IGetMoviesByStringDatasource datasource;
  late IGetMoviesByStringRepository repository;

  setUp(() {
    datasource = GetMoviesByStringMock();
    repository = GetMoviesByStringRepositoryImpl(datasource);
  });

  const search = 'search';

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

  test('Repository:GETMOVIESBYSTRING > should return movie list not null',
      () async {
    when(
      () => datasource.getMovies(value: search),
    ).thenAnswer((_) async => dummyList);

    final response = await repository.getMovies(value: search);

    expect(response, isNotNull);
  });

  test(
      'Repository:GETMOVIESBYSTRING > should return a list from Movie Entity per string',
      () async {
    when(
      () => datasource.getMovies(value: search),
    ).thenAnswer((_) async => (dummyList));

    final response = await repository.getMovies(value: search);

    expect(response.fold((l) => l, (r) => r), isA<List<MovieEntity>>());
  });

  tearDown(() {
    repository;
    datasource;
  });
}
