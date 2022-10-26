import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_all_movies_repository.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_all_movies_usecase.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/external/get_all_movies_datasource_impl.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_all_movies_datasource.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/repository/get_all_movies_repository_impl.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/movies_page.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/store/movies_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoviesModule extends Module {
  @override
  final List<Bind> binds = [
    //datasource
    Bind.lazySingleton<IGetAllMoviesDatasource>(
        (i) => GetAllMoviesDatasourceImpl(i())),

    //repository
    Bind.lazySingleton<IGetAllMoviesRepository>(
        (i) => GetAllMoviesRepositoryImpl(i())),

    //usecase
    Bind.lazySingleton<IGetAllMoviesUsecase>(
        (i) => GetAllMoviesUsecaseImpl(i())),

    //Store
    Bind.lazySingleton<MoviesStore>((i) => MoviesStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => MoviesPage(
        store: Modular.get<MoviesStore>(),
      ),
    ),
  ];
}
