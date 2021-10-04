import '../entities/entities.dart';

abstract class AddAccount {
  Future<UserEntity> add(AddAccountParams params);
}

class AddAccountParams {
  final String username;

  final String password;

  AddAccountParams({required this.password, required this.username});
}
