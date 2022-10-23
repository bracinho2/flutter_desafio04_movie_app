import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_all_movies_repository.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_all_movies_datasource.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/repository/get_all_movies_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetAllMOviesDatasourceMock extends Mock
    implements IGetAllMoviesDatasource {}

void main() {
  late IGetAllMoviesDatasource datasource;
  late IGetAllMoviesRepository repository;

  setUp(() {
    datasource = GetAllMOviesDatasourceMock();
    repository = GetAllMoviesRepositoryImpl(datasource);
  });

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

  test('Repository:GETALLMOVIES > should return movie not null', () async {
    when(
      () => datasource.getMovies(),
    ).thenAnswer((_) async => dummyList);

    final response = await repository.getMovies();

    expect(response, isNotNull);
  });

  test('Repository:GETALLMOVIES > should return a list from Movie Entity',
      () async {
    when(
      () => datasource.getMovies(),
    ).thenAnswer((_) async => (dummyList));

    final response = await repository.getMovies();

    expect(response.fold((l) => l, (r) => r), isA<List<MovieEntity>>());
  });

  tearDown(() {
    repository;
    datasource;
  });
}
