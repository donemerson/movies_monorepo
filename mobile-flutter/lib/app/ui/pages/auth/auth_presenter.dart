// ignore: unused_import
import '../../../data/data.dart';

// ignore: unused_import
import '../../../domain/domain.dart';
import '../../helpers/helpers.dart';

abstract class AuthPresenter implements Disposable {
  Future<void> auth(String username, String password);
  Future<void> singup(String username, String password);
  Future<void> autoauth();
}
