import 'package:dio/dio.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late DioMock dio;
  late DioHttpClientImpl dioHttpClientImpl;

  setUp(() {
    dio = DioMock();
    dioHttpClientImpl = DioHttpClientImpl(dio);
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

  const urlBase = 'path';

  test('HTTPCLIENTE; Should return a list from API', () async {
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
        data: dummyList,
        requestOptions: RequestOptions(path: urlBase),
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