import '../entities/entities.dart';

abstract class Authentication {
  Future<UserEntity> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String username;
  final String password;

  AuthenticationParams({required this.username, required this.password});
}
