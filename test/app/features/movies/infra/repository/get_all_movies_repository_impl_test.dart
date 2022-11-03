import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_all_movies_repository.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_all_movies_datasource.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/repository/get_all_movies_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:peabiru/peabiru.dart';

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
      "title": "name",
      "popularity": 10.92,
      "category": {"id": "01", "name": "category"},
      "vote_average": 10.92,
      "original_language": "EUA",
      "poster_path": "/oooo.jpg",
      "favorite": "true",
      "overview": "bla bla bla",
      "release_date": "2022-10-20"
    },
    {
      "id": "01",
      "title": "name",
      "popularity": 10.92,
      "category": {"id": "01", "name": "category"},
      "vote_average": 10.92,
      "original_language": "EUA",
      "poster_path": "/oooo.jpg",
      "favorite": "true",
      "overview": "bla bla bla",
      "release_date": "2022-10-20"
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
