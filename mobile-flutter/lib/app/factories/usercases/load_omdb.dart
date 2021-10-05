import 'package:movies_flix/app/data/data.dart';
import 'package:movies_flix/app/domain/domain.dart';

import '../factories.dart';

LoadOMDb makeRemoteLoadOMDb() => RemoteLoadOMDb(makeHttpClient());
