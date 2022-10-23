import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/level_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_all_movies_repository.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_all_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MoviesRepositoryMock extends Mock implements IGetAllMoviesRepository {}

void main() {
  late IGetAllMoviesRepository movieRepositoryImpl;
  late GetAllMoviesImpl getAllMoviesImpl;

  final level = LevelMovieEntity(id: 01, name: 'name');
  final category = CategoryEntity(id: 01, name: 'name');

  final movies = [
    MovieEntity(
      id: 01,
      name: 'My Movie',
      level: level,
      evaluation: 9.5,
      accent: 'teste',
      imagePath: 'imagePath',
      category: category,
      favorite: false,
    ),
    MovieEntity(
      id: 01,
      name: 'name',
      level: level,
      evaluation: 9.5,
      accent: 'teste',
      imagePath: 'imagePath',
      category: category,
      favorite: false,
    ),
  ];

  final failure = HttpClientError(message: 'error');

  setUp(() {
    movieRepositoryImpl = MoviesRepositoryMock();
    getAllMoviesImpl = GetAllMoviesImpl(movieRepositoryImpl);
  });

  test('Usecase:GETALLMOVIES > should movie list not null', () async {
    when(() => movieRepositoryImpl.getMovies())
        .thenAnswer((_) async => Right(movies));
    final result = await getAllMoviesImpl.getMovies();

    expect(result, isNotNull);
  });

  test('Usecase:GETALLMOVIES > should return an right with a movie list',
      () async {
    when(() => movieRepositoryImpl.getMovies())
        .thenAnswer((_) async => Right(movies));
    final response = await getAllMoviesImpl.getMovies();

    expect(response.fold((l) => l, (r) => r), isA<List<MovieEntity>>());
  });

  //TODO: teste de left no usecase
  test('Usecase:GETALLMOVIES > should return an left with http client error',
      () async {
    when(() => movieRepositoryImpl.getMovies())
        .thenAnswer((_) async => Left(failure));
    final response = await getAllMoviesImpl.getMovies();

    expect(response.fold((l) => l, (r) => r), isA<HttpClientError>());
  });

  tearDown(() {
    movieRepositoryImpl;
    getAllMoviesImpl;
  });
}
