import 'package:movies_flix/app/factories/cache/cache.dart';

import '../../data/usecases/usecases.dart';
import '../../domain/usecases/usecases.dart';

LocalUser makeLocalUser() => RemoteLocalUser(makeSecureStorageAdapter());
