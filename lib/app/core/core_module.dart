import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_service_impl.dart';
import 'package:flutter_desafio04_movie_app/app/core/snake_bar_manager/snake_bar_manager.dart';
import 'package:peabiru/peabiru.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => Uno(), export: true),
    Bind.singleton<HttpClientService>((i) => DioHttpClientImpl(i()),
        export: true),

    //snake bar manager
    Bind.singleton<SnakeBarManager>((i) => SnakeBarManager(), export: true),
  ];
}
