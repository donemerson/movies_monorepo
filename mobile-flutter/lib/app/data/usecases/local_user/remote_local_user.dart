import 'dart:convert';

import 'package:movies_flix/app/data/data.dart';
import 'package:movies_flix/app/infra/infra.dart';

import '../../../domain/domain.dart';

class RemoteLocalUser implements LocalUser {
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  RemoteLocalUser(this.fetchSecureCacheStorage);
  Future<UserEntity?> load() async {
    try {
      String? json = await fetchSecureCacheStorage.fetch('user');
      if (json != null) {
        final _model = RemoteUserModel.fromJson(jsonDecode(json));
        final _entity = _model.toEntity();
        return _entity;
      }
    } catch (e) {
      return null;
    }
  }
}
