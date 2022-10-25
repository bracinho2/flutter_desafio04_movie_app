import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/external/get_all_movies_datasource_impl.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_all_movies_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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

  test('External:GETALLMOVIES > should return an list from api', () async {
    when(
      () => http.fetch(path: 'path'),
    ).thenAnswer((_) async => dummyList);

    final response = await datasource.getMovies();

    expect(response, isA<List<Map<String, dynamic>>>());
  });

  tearDown(() {
    http;
    datasource;
  });
}
