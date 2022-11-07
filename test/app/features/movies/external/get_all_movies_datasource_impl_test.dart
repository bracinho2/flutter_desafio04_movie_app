import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/external/get_all_movies_datasource_impl.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_all_movies_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:peabiru/peabiru.dart';

class HttpClientMock extends Mock implements HttpClientService {}

void main() {
  late HttpClientService http;
  late IGetAllMoviesDatasource datasource;

  setUp(() {
    http = HttpClientMock();
    datasource = GetAllMoviesDatasourceImpl(http);
  });

  final dummyList = [
    {
      "id": "01",
      "name": "name",
      "popularity": "10.92",
      "category": {"id": "01", "name": "category"},
      "evaluation": "10.92",
      "original_language": "EUA",
      "image_path": "/oooo.jpg",
      "favorite": "true",
      "overview": "bla bla bla",
      "release_date": "2022-10-20"
    },
    {
      "id": "01",
      "name": "name",
      "popularity": "10.92",
      "category": {"id": "01", "name": "category"},
      "evaluation": "10.92",
      "original_language": "EUA",
      "image_path": "/oooo.jpg",
      "favorite": "true",
      "overview": "bla bla bla",
      "release_date": "2022-10-20"
    }
  ];

  test('External:GETALLMOVIES > should return an list from api', () async {
    when(
      () => http.fetch(path: any(named: 'path')),
    ).thenAnswer((_) async => dummyList);

    final response = await datasource.getMovies();

    expect(response, isA<List<Map<String, dynamic>>>());
  });

  tearDown(() {
    http;
    datasource;
  });
}
