import 'package:movies_flix/app/data/data.dart';

import '../../../domain/domain.dart';
import '../../helpers/helpers.dart';

abstract class MoviesPresenter implements Disposable {
  List<MovieEntity> get movies;
  UIState get state;
  Future<void> reload();
  Future<void> index();
  NetworkCacheClient get networkCacheClient;
  Future<void> logoft();
}
