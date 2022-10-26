import 'package:flutter_desafio04_movie_app/app/features/movies/domain/usecases/get_all_movies_usecase.dart';

class MoviesStore {
  final IGetAllMoviesUsecase _iGetAllMoviesUsecase;

  MoviesStore(
    this._iGetAllMoviesUsecase,
  ) : super();

  Future<void> getAllMovies() async {
    final response = await _iGetAllMoviesUsecase.getMovies();
    response.fold((l) => null, (r) => print(r));
  }
}
