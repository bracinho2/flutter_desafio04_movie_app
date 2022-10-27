import 'package:flutter_desafio04_movie_app/app/core/dummy_data/dummy_data.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:uno/uno.dart';

class DioHttpClientImpl implements HttpClientService {
  final Uno _uno;

  DioHttpClientImpl(this._uno);
  @override
  Future<List<Map<String, dynamic>>> fetch({required String path}) async {
    try {
      //final response = await _dio.get(path);
      final values = dummyDataList;
      //response.data;
      return values;
    } on UnoError catch (e, stackTrace) {
      if (e.response!.status == 404) {
        throw HttpClientError(message: 'O servidor não foi encontrado!');
      } else if (e.response!.status == 503) {
        throw HttpClientError(message: 'O servidor está fora do ar!');
      }
      throw HttpClientError(
          message: 'O servidor apresentou um problema', stackTrace: stackTrace);
    }
  }
}
