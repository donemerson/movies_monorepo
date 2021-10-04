abstract class HttpClient {
  Future<dynamic> request({
    required String url,
    required String method,
    Map body = const {},
    Map headers = const {},
    Map<String, dynamic> queryParams = const {},
  });
}
