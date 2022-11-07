import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/store/movies_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:peabiru/peabiru.dart';
import 'package:triple_test/triple_test.dart';

class MockMoviesStore extends MockStore<Failure, List<MovieEntity>>
    implements MoviesStore {}

final mock = MockMoviesStore();

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
      mock,
      input: () => mock.getAllMovies(),
      initialState: [],
      triples: [
        Triple(state: movies),
        Triple(isLoading: true, event: TripleEvent.loading, state: movies),
        Triple(state: []),
      ],
    );
  });
  storeTest<MockMoviesStore>(
    'Testing triple',
    build: () => MockMoviesStore(),
    act: (store) => mock.getAllMovies(),
    expect: () => [
      tripleState,
      right(movies),
    ],
  );
}
