import 'package:flutter_desafio04_movie_app/app/core/core_module.dart';
import 'package:flutter_desafio04_movie_app/app/core/pages/splash_page.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/movies_module.dart';
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
      child: ((context, args) => const SplashPage()),
    ),
    ModuleRoute('/movies/', module: MoviesModule())
  ];
}
