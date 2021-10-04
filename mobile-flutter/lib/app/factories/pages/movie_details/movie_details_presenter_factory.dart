import 'package:movies_flix/app/data/network_cache/network_cache.dart';
import 'package:movies_flix/app/domain/domain.dart';
import 'package:movies_flix/app/factories/usercases/local_user_factory.dart';

import '../../usercases/usercases.dart';
import '../../../presentation/presentation.dart';
import '../../../ui/pages/pages.dart';

MovieDetailsPresenter makeStoreMovieDetailsPresenter(
  NetworkCacheClient networkCacheClient,
  MovieEntity movieEntity,
) =>
    StoreMovieDetailsPresenter(
      makeRemoteLoadMovies(),
      networkCacheClient,
      movieEntity,
      makeLocalUser(),
    );
