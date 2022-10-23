abstract class IGetMoviesByStringDatasource {
  Future<List<Map<String, dynamic>>> getMovies({required String value});
}
