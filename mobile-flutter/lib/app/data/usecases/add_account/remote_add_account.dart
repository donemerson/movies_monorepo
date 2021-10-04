import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../http/http.dart';
import '../../models/models.dart';

class RemoteAddAccount implements AddAccount {
  final HttpClient httpClient;
  final String url;

  RemoteAddAccount({required this.httpClient, required this.url});

  Future<UserEntity> add(AddAccountParams params) async {
    final body = RemoteAddAccountParams.fromDomain(params).toJson();
    try {
      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);
      return RemoteUserModel.fromJson(httpResponse).toEntity();
    } on HttpError catch (_) {
      throw DomainError.unexpected;
    }
  }
}

class RemoteAddAccountParams {
  final String username;

  final String password;

  RemoteAddAccountParams({
    required this.username,
    required this.password,
  });

  factory RemoteAddAccountParams.fromDomain(AddAccountParams params) =>
      RemoteAddAccountParams(
        username: params.username,
        password: params.password,
      );

  Map toJson() => {
        'username': username,
        'password': password,
      };
}
