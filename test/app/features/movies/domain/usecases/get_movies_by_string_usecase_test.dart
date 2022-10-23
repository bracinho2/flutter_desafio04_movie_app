import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_movies_by_string_repository.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_movies_by_string_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MoviesRepositoryMock extends Mock
    implements IGetMoviesByStringRepository {}

void main() {
  late IGetMoviesByStringRepository repository;
  late IGetMoviesByStringUsecase usecase;

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

  const search = 'teste';

  setUp(() {
    repository = MoviesRepositoryMock();
    usecase = GetMoviesByStringUsecaseImpl(repository);
  });

  test('shuld return an right with a movie list', () async {
    when(() => repository.getMovies(value: search))
        .thenAnswer((_) async => Right(movies));
    final response = await usecase.getMovies(value: search);

    expect(response.fold((l) => l, (r) => r), isA<List<MovieEntity>>());
  });

  //TODO: teste de left no usecase
  test('should return an left with http client error', () async {
    when(() => repository.getMovies(value: search))
        .thenAnswer((_) async => Left(failure));
    final response = await usecase.getMovies(value: search);

    expect(response.fold((l) => l, (r) => r), isA<HttpClientError>());
  });

  tearDown(() {
    repository;
    usecase;
  });
}
