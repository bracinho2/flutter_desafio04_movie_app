import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/external/get_movies_by_string_datasource_impl.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_movies_by_string_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientMock extends Mock implements HttpClientService {}

void main() {
  late HttpClientService http;
  late IGetMoviesByStringDatasource datasource;

  setUp(() {
    http = HttpClientMock();
    datasource = GetMoviesByStringDatasourceImpl(http);
  });

  const value = 'teste';

  const urlBase = 'teste';

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

  test('External:GETMOVIESBYSTRING > should return an list from api', () async {
    when(
      () => http.fetch(path: urlBase),
    ).thenAnswer((_) async => dummyList);

    final response = await datasource.getMovies(value: value);

    expect(response, isA<List<Map<String, dynamic>>>());
  });

  tearDown(() {
    http;
    datasource;
  });
}
