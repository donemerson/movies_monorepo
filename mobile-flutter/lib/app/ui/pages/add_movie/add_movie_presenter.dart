import 'package:movies_flix/app/data/data.dart';

import '../../../domain/domain.dart';
import '../../helpers/helpers.dart';

abstract class AddMoviePresenter implements Disposable {
  List<OMDbEntity> get movies;
  UIState get state;
  Future<void> search(String title, String year);
  Future<void> add(String id);

  NetworkCacheClient get networkCacheClient;
}
