import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/core/snake_bar_manager/snake_bar_manager.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_all_movies_usecase.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/store/movies_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:peabiru/peabiru.dart';
import 'package:triple_test/triple_test.dart';

class MockUseCase extends MockStore<Failure, List<MovieEntity>>
    implements IGetAllMoviesUsecase {}

final usecase = MockUseCase();

void main() {
  final movies = [
    MovieEntity(
        id: 01,
        name: 'My Movie',
        popularity: 10.92,
        evaluation: 9.5,
        language: 'teste',
        imagePath: 'imagePath',
        category: CategoryEntity(id: 01, name: '', selected: true),
        favorite: false,
        overview: '',
        releaseDate: ''),
    MovieEntity(
        id: 01,
        name: 'name',
        popularity: 10.92,
        evaluation: 9.5,
        language: 'teste',
        imagePath: 'imagePath',
        category: CategoryEntity(id: 01, name: '', selected: true),
        favorite: false,
        overview: '',
        releaseDate: ''),
  ];

  test('bla', () {
    whenObserve<Failure, List<MovieEntity>>(
      usecase,
      input: () => usecase.getMovies(),
      initialState: [],
      triples: [
        Triple(state: movies),
        Triple(isLoading: true, event: TripleEvent.loading, state: movies),
        Triple(state: []),
      ],
    );
  });
  storeTest<MoviesStore>(
    'Should return a Triple State',
    build: () {
      when(() => usecase.getMovies()).thenAnswer((_) async => right(movies));
      final store = MoviesStore(usecase, SnakeBarManager());
      return store;
    },
    act: (store) => store.getAllMovies(),
    expect: () => [
      tripleLoading,
      tripleState,
    ],
  );

  storeTest<MoviesStore>(
    'Should return a Triple Error',
    build: () {
      when(() => usecase.getMovies())
          .thenAnswer((_) async => left(UsecaseError(message: 'Error')));
      final store = MoviesStore(usecase, SnakeBarManager());
      return store;
    },
    act: (store) => store.getAllMovies(),
    expect: () => [
      tripleLoading,
      tripleError,
    ],
  );
}
