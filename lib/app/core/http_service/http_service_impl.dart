import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:peabiru/peabiru.dart';

class DioHttpClientImpl implements HttpClientService {
  final Uno _uno;

  DioHttpClientImpl(this._uno);
  @override
  Future<List<Map<String, dynamic>>> fetch({required String path}) async {
    try {
      final response = await _uno.get(path);

      final values = List<Map<String, dynamic>>.from(response.data['results']);

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
