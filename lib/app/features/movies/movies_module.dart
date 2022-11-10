import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_all_movies_repository.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_all_movies_usecase.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_movies_by_string_usecase.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/external/get_all_movies_datasource_impl.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/datasource/get_all_movies_datasource.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/repository/get_all_movies_repository_impl.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/movies_page.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/movies_page_details.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/movies_page_state.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/store/movies_store.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/store/movies_store_state.dart';
import 'package:peabiru/peabiru.dart';

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

    //
    Bind.lazySingleton<IGetMoviesByStringUsecase>(
        (i) => GetMoviesByStringUsecaseImpl()),

    //Store
    Bind.lazySingleton<MoviesStore>((i) => MoviesStore(i(), i())),

    //Store com State
    Bind.lazySingleton<MoviesStoreState>((i) => MoviesStoreState(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => MoviesPageState(
        store: Modular.get<MoviesStoreState>(),
      ),
    ),
    // ChildRoute(
    //   '/',
    //   child: (context, args) => MoviesPage(
    //     store: Modular.get<MoviesStore>(),
    //   ),
    // ),
    ChildRoute(
      '/details/',
      child: (context, args) => MoviesPageDetails(
        movie: args.data as MovieEntity,
      ),
    ),
  ];
}
