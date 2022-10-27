import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => Uno(), export: true),
    Bind.singleton<HttpClientService>((i) => DioHttpClientImpl(i()),
        export: true),
  ];
}
