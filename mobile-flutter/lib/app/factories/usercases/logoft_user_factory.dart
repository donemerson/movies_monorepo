import 'package:movies_flix/app/data/usecases/logoft_user/remote_logoft_user.dart';
import 'package:movies_flix/app/factories/cache/cache.dart';

import '../../domain/usecases/usecases.dart';

LogoftUser makeRemoteLogoftUser() =>
    RemoteLogoftUser(makeSecureStorageAdapter());
