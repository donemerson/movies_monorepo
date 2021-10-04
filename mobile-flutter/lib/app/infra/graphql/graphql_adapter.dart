import 'dart:convert';

import 'package:http/http.dart';

import '../../data/data.dart';

class GraphQLAdapter implements GraphQLClient {
  final Client client;
  final Map<String, String> headers;

  GraphQLAdapter(this.client, [this.headers = const <String, String>{}]);
  @override
  Future<Map<String, dynamic>> request({
    required String url,
    required String query,
    String? cacheKey,
  }) async {
    final _headers = <String, String>{
      'content-type': 'application/json',
      'accept': 'application/json',
      ...headers,
    };
    final body = <String, String>{'query': query};
    final uri = Uri.parse(url);
    var futureResponse =
        client.post(uri, body: jsonEncode(body), headers: _headers);
    var response = await futureResponse.timeout(const Duration(seconds: 30));

    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
