import 'package:flutter_desafio04_movie_app/app/core/core_module.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/movies_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => const MoviesPage()),
    ),
  ];
}
