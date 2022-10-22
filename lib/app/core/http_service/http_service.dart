abstract class HttpClient {
  Future<Map<String, dynamic>> fetch({
    required String path,
  });
}
