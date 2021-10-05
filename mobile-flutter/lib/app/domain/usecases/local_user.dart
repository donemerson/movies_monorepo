import 'package:movies_flix/app/domain/domain.dart';

abstract class LocalUser {
  Future<UserEntity?> load();
}
