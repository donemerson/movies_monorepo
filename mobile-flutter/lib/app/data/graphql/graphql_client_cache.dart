import 'package:movies_flix/app/data/data.dart';

abstract class GraphQLClientCache extends GraphQLClient {
  Future<Map<String, dynamic>> request(
      {required String url, required String query});
}
