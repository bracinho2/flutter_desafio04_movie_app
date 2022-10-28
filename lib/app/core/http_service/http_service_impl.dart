import 'dart:convert';

import 'package:flutter_desafio04_movie_app/app/core/api/api_paths.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:uno/uno.dart';

class DioHttpClientImpl implements HttpClientService {
  final Uno _uno;

  DioHttpClientImpl(this._uno);
  @override
  Future<List<Map<String, dynamic>>> fetch({required String path}) async {
    try {
      final response = await _uno.get(path);

      print(response.data.runtimeType);

      final values = (response.data['results'] as List)
          .map((map) => Map<String, dynamic>)
          .toList();

      print(values.map((e) => print(e)));

      return [];
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
