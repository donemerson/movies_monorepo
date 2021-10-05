import 'package:movies_flix/app/domain/domain.dart';
import 'package:movies_flix/app/infra/cache/cache.dart';
import 'package:movies_flix/app/infra/infra.dart';

class RemoteLogoftUser implements LogoftUser {
  final DeleteSecureCacheStorage deleteSecureCacheStorage;

  RemoteLogoftUser(this.deleteSecureCacheStorage);

  @override
  Future<void> logoft() async {
    await deleteSecureCacheStorage.delete('user');
    MyNavigator.offNamed('/');
  }
}
