import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../http/http.dart';
import '../../models/models.dart';

class RemoteAuthentication implements Authentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<UserEntity> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();
    try {
      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);
      return RemoteUserModel.fromJson(httpResponse['data']).toEntity();
    } on HttpError catch (_) {
      rethrow;
    }
  }
}

class RemoteAuthenticationParams {
  final String username;
  final String password;

  RemoteAuthenticationParams({required this.username, required this.password});

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) =>
      RemoteAuthenticationParams(
          username: params.username, password: params.password);

  Map toJson() => {'username': username, 'password': password};
}
