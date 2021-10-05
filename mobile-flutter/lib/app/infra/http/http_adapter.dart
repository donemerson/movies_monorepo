import 'dart:convert';

import '../../domain/domain.dart';
import 'package:http/http.dart';

import '../../data/http/http.dart';

class HttpAdapter implements HttpClient {
  final Client client;
  final Future<Map<String, String>>? headers;

  HttpAdapter(this.client, [this.headers]);

  Future<dynamic> request({
    required String url,
    required String method,
    Map body = const {},
    Map headers = const {},
    Map<String, dynamic> queryParams = const {},
  }) async {
    var defaultHeaders = <String, String>{
      'content-type': 'application/json',
      'accept': 'application/json',
      ...headers,
    };
    if (this.headers != null) {
      await this.headers!.then((value) {
        defaultHeaders.addAll(value);
      });
    }

    final jsonBody = jsonEncode(body);
    var response = Response('', 500);
    late Future<Response> futureResponse;

    var query = Uri(queryParameters: queryParams).query;
    url = '$url?$query';
    final uri = Uri.parse(url);
    try {
      if (method == 'post') {
        futureResponse =
            client.post(uri, headers: defaultHeaders, body: jsonBody);
      } else if (method == 'get') {
        futureResponse = client.get(uri, headers: defaultHeaders);
      } else if (method == 'put') {
        futureResponse =
            client.put(uri, headers: defaultHeaders, body: jsonBody);
      } else if (method == 'patch') {
        futureResponse =
            client.patch(uri, headers: defaultHeaders, body: jsonBody);
      } else if (method == 'delete') {
        futureResponse =
            client.delete(uri, headers: defaultHeaders, body: jsonBody);
      } else {
        throw DomainError.unexpected;
      }

      response = await futureResponse.timeout(Duration(seconds: 10));
    } catch (error) {
      throw HttpError.serverError;
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) async {
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
