abstract class HttpClientService {
  Future<List<Map<String, dynamic>>> fetch({
    required String path,
  });
}
