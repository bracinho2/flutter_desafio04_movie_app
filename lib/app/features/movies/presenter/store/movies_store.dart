

class MoviesStore extends StreamStore<Failure, List<MovieEntity>{
  final IGetAllMoviesUsecase _iGetAllMoviesUsecase;

  MoviesStore(
    this._iGetAllMoviesUsecase,
  ) : super([]);

  Future<void> getAllMovies() async {
    final response = await _iGetAllMoviesUsecase.getMovies();
    response.fold((l) => null, (r) => print(r));
  }
}
