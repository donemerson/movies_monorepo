import '../../data/data.dart';

class GraphQLAdapterCache implements GraphQLClientCache {
  final GraphQLClient graphQLAdapter;
  final DBClient dbClient;
  final UuidClient uuidClient;
  GraphQLAdapterCache(this.graphQLAdapter, this.dbClient, this.uuidClient);

  @override
  Future<Map<String, dynamic>> request(
      {required String url, required String query}) async {
    final cacheKey = uuidClient.generate(url + query);
    try {
      final data = await graphQLAdapter.request(url: url, query: query);
      dbClient.setData(cacheKey, data);
      return data;
    } catch (e) {
      var _data = await dbClient.getData(cacheKey);
      return _data;
    }
  }
}
