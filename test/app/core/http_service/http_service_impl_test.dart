import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:peabiru/peabiru.dart';

class DioMock extends Mock implements Uno {}

void main() {
  late DioMock dio;
  late DioHttpClientImpl dioHttpClientImpl;

  setUp(() {
    dio = DioMock();
    dioHttpClientImpl = DioHttpClientImpl(dio);
  });

  final dummyList = {
    "results": [
      {
        "id": "01",
        "name": "name",
        "popularity": "10.92",
        "category": {"id": "01", "name": "category"},
        "evaluation": "10.92",
        "language": "EUA",
        "imagePath": "/oooo.jpg",
        "favorite": "true",
        "overview": "bla bla bla",
        "releaseDate": "2022-10-20"
      },
      {
        "id": "01",
        "name": "name",
        "popularity": "10.92",
        "category": {"id": "01", "name": "category"},
        "evaluation": "10.92",
        "language": "EUA",
        "imagePath": "/oooo.jpg",
        "favorite": "true",
        "overview": "bla bla bla",
        "releaseDate": "2022-10-20"
      }
    ]
  };

  const urlBase = 'path';

  test('HTTPCLIENTE; Should return a list from API', () async {
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
        headers: {},
        data: dummyList,
        request: Request(
            uri: Uri(),
            method: 'post',
            headers: {},
            timeout: const Duration(seconds: 2)),
        status: 200,
      ),
    );

    final response = await dioHttpClientImpl.fetch(path: urlBase);

    expect(response, isA<List<Map<String, dynamic>>>());
  });

  tearDown(() {
    dio;
    dioHttpClientImpl;
  });
}
