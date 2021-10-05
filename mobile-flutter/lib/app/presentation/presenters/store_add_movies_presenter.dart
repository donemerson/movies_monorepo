import 'dart:async';
import 'package:movies_flix/app/data/data.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_flix/app/infra/infra.dart';
import '../../domain/domain.dart';
import '../../ui/ui.dart';

class StoreAddMoviePresenter implements AddMoviePresenter {
  late int page, limit;

  late final LoadMovies _loadMovies;
  late final LoadOMDb _loadOMDb;
  late final Observable<UIState> _stateObs;

  @override
  final NetworkCacheClient networkCacheClient;

  @override
  late final ObservableList<OMDbEntity> movies;

  // constructor
  StoreAddMoviePresenter(
      this._loadMovies, this._loadOMDb, this.networkCacheClient) {
    movies = ObservableList<OMDbEntity>(name: 'OMDb movies');
    _stateObs = Observable<UIState>(UIState.done, name: 'UIState');
    page = 0;
    limit = 10;
  }

  @override
  UIState get state => _stateObs.value;

  set _state(UIState value) =>
      runInAction(() => _stateObs.value = value, name: 'setUIState');

  @override
  void dispose() {}

  // MovieList
  void _addMovies(List<OMDbEntity> entities) => runInAction(() {
        movies.addAll(entities);
      }, name: 'Add OMDb movie to List of Entities');

  void _clearMovies() => runInAction(() {
        movies.clear();
      }, name: 'Clear all OMDb movies');

  @override
  Future<void> add(String id) async {
    try {
      if (state != UIState.loading) _state = UIState.loading;

      final entity = await _loadOMDb.searchById(id);
      await _loadMovies.store(
        RemoteMutationMovieModel.fromJson(
          RemoteOMDbModel.fromEntity(entity).toJson(),
        ).toEntity(),
      );
      MyNavigator.offNamed('/movies');
    } catch (e) {
      _state = UIState.error;
    }
  }

  @override
  Future<void> search(String title, String year) async {
    if (state != UIState.loading) _state = UIState.loading;

    try {
      var listEntity = await _loadOMDb.searchByTtitleYear(title, year);
      if (listEntity.isNotEmpty) {
        _clearMovies();
        _addMovies(listEntity);
        _state = UIState.done;
      } else {
        _state = UIState.error;
      }
    } catch (_) {
      _state = UIState.error;
    }
  }
}
