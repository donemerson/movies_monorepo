import 'package:movies_flix/app/domain/domain.dart';
import 'package:movies_flix/app/infra/infra.dart';

abstract class LocalUser {
  Future<UserEntity?> load();
}
