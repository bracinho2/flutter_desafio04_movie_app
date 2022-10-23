import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_all_movies_repository.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_all_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MoviesRepositoryMock extends Mock implements IGetAllMoviesRepository {}

void main() {
  late IGetAllMoviesRepository movieRepositoryImpl;
  late GetAllMoviesImpl getAllMoviesImpl;

  final movies = [
    MovieEntity(
      id: 01,
      name: 'My Movie',
      level: MovieLevel.Medium,
      evaluation: 9.5,
      accent: 'teste',
      imagePath: 'imagePath',
      category: MovieCategory.Animation,
      favorite: false,
    ),
    MovieEntity(
      id: 01,
      name: 'name',
      level: MovieLevel.Medium,
      evaluation: 9.5,
      accent: 'teste',
      imagePath: 'imagePath',
      category: MovieCategory.Animation,
      favorite: false,
    ),
  ];

  final failure = HttpClientError(message: 'error');

  setUp(() {
    movieRepositoryImpl = MoviesRepositoryMock();
    getAllMoviesImpl = GetAllMoviesImpl(movieRepositoryImpl);
  });

  test('should movie list not null', () async {
    when(() => movieRepositoryImpl.getMovies())
        .thenAnswer((_) async => Right(movies));
    final result = await getAllMoviesImpl.getMovies();

    expect(result, isNotNull);
  });

  test('shuld return an right with a movie list', () async {
    when(() => movieRepositoryImpl.getMovies())
        .thenAnswer((_) async => Right(movies));
    final response = await getAllMoviesImpl.getMovies();

    expect(response.fold((l) => l, (r) => r), isA<List<MovieEntity>>());
  });

  //TODO: teste de left no usecase
  test('should return an left with http client error', () async {
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
