import 'dart:async';
import 'dart:convert';

import '../../domain/domain.dart';
import '../../infra/infra.dart';
import '../../ui/ui.dart';

class StoreAuthPresenter implements AuthPresenter {
  final Authentication authentcatonUsercase;
  final AddAccount addAccountUsercase;
  final SaveSecureCacheStorage saveSecureCacheStorage;
  final LocalUser localUser;
  StoreAuthPresenter(this.authentcatonUsercase, this.addAccountUsercase,
      this.saveSecureCacheStorage, this.localUser);

  Future<void> auth(String username, String password) async {
    late final UserEntity entity;
    try {
      entity = await authentcatonUsercase
          .auth(AuthenticationParams(username: username, password: password));
      await saveSecureCacheStorage.save(
          key: 'user',
          value: jsonEncode({
            'id': entity.id,
            'username': entity.username,
            'token': entity.token,
          }));
      MyNavigator.offNamed('/movies');
    } on DomainError catch (_) {
      rethrow;
    }
  }

  Future<void> singup(String username, String password) async {
    late final UserEntity entity;
    try {
      entity = await addAccountUsercase
          .add(AddAccountParams(username: username, password: password));
      await saveSecureCacheStorage.save(
          key: 'user',
          value: jsonEncode({
            'id': entity.id,
            'username': entity.username,
            'token': entity.token,
          }));
      MyNavigator.offNamed('/movies');
    } on DomainError catch (_) {
      rethrow;
    }
  }

  Future<void> autoauth() async {
    try {
      final _entity = await localUser.load();
      if (_entity != null) {
        MyNavigator.offNamed('/movies');
      } else {
        // nothing
      }
    } catch (e) {
      // nothing

    }
  }

  void dispose() {}
}
