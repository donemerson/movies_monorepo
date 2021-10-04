abstract class GraphQLClient {
  Future<Map<String, dynamic>> request(
      {required String url, required String query});
}
