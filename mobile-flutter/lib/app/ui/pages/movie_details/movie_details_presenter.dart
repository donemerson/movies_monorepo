import '../../../data/data.dart';

import '../../../domain/domain.dart';
import '../../helpers/helpers.dart';

abstract class MovieDetailsPresenter implements Disposable {
  MovieEntity get entity;

  Future<void> comment(String value);
  Future<void> rate(int value);
  NetworkCacheClient get networkCacheClient;
  UIState get uiState;
}
