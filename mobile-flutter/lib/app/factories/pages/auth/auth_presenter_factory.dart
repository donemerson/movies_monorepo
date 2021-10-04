import 'package:movies_flix/app/factories/cache/cache.dart';
import 'package:movies_flix/app/factories/usercases/add_account_factory.dart';
import 'package:movies_flix/app/factories/usercases/authentication_factory.dart';
import 'package:movies_flix/app/factories/usercases/local_user_factory.dart';

import '../../../presentation/presentation.dart';
import '../../../ui/pages/pages.dart';

AuthPresenter makeStoreAuthPresenter() => StoreAuthPresenter(
      makeRemoteAuthentication(),
      makeRemoteAddAccount(),
      makeSecureStorageAdapter(),
      makeLocalUser(),
    );
