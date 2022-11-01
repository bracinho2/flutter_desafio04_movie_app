import 'package:dartz/dartz.dart';
import 'package:flutter_desafio04_movie_app/app/core/http_service/http_client_errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/level_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/repositories/get_movies_by_category_repository.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_movies_by_filter_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MoviesRepositoryMock extends Mock
    implements IGetMoviesByCategoryRepository {}

void main() {
  late IGetMoviesByCategoryRepository repository;
  late IGetMoviesByCategoryUsecase usecase;

  final level = LevelMovieEntity(id: 01, name: 'name');
  final category = CategoryEntity(id: 01, name: 'name', selected: true);

  final movies = [
    MovieEntity(
        id: 01,
        name: 'My Movie',
        popularity: 10.92,
        evaluation: 9.5,
        accent: 'teste',
        imagePath: 'imagePath',
        category: category,
        favorite: false,
        overview: '',
        releaseDate: ''),
    MovieEntity(
        id: 01,
        name: 'name',
        popularity: 10.92,
        evaluation: 9.5,
        accent: 'teste',
        imagePath: 'imagePath',
        category: category,
        favorite: false,
        overview: '',
        releaseDate: ''),
  ];

  final failure = HttpClientError(message: 'error');

  setUp(() {
    repository = MoviesRepositoryMock();
    usecase = GetMoviesByFilterUsecaseImpl(repository);
  });

  test('Usecase:GETMOVIESBYCATEGORY > shuld return an right with a movie list',
      () async {
    when(() => repository.getMovies(category: category))
        .thenAnswer((_) async => Right(movies));
    final response = await usecase.getMovies(category: category);

    expect(response.fold((l) => l, (r) => r), isA<List<MovieEntity>>());
  });

  test(
      'Usecase:GETMOVIESBYCATEGORY > should return an left with http client error',
      () async {
    when(() => repository.getMovies(category: category))
        .thenAnswer((_) async => Left(failure));
    final response = await usecase.getMovies(category: category);

    expect(response.fold((l) => l, (r) => r), isA<HttpClientError>());
  });

  tearDown(() {
    repository;
    usecase;
  });
}
