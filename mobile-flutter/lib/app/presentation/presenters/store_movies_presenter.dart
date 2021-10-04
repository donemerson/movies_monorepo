import 'dart:async';
import 'package:movies_flix/app/data/data.dart';
import 'package:mobx/mobx.dart';
import '../../domain/domain.dart';
import '../../ui/ui.dart';

class StoreMoviesPresenter implements MoviesPresenter {
  late int page, limit;

  late final LoadMovies _loadMovies;
  late final Observable<UIState> _stateObs;

  @override
  final NetworkCacheClient networkCacheClient;

  @override
  late final ObservableList<MovieEntity> movies;

  // constructor
  StoreMoviesPresenter(this._loadMovies, this.networkCacheClient) {
    movies = ObservableList<MovieEntity>(name: 'movies');
    _stateObs = Observable<UIState>(UIState.loading, name: 'UIState');
    page = 0;
    limit = 10;
  }

  @override
  UIState get state => _stateObs.value;

  set _state(UIState value) =>
      runInAction(() => _stateObs.value = value, name: 'setUIState');

  @override
  Future<void> reload() async {
    if (state != UIState.loading) _state = UIState.loading;
    _resetPage();
    try {
      var listEntity = await _loadMovies.index(page, limit);
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

  @override
  Future<void> index() async {
    if (state != UIState.loading) _state = UIState.loading;
    _incrementPage();
    try {
      var listEntity = await _loadMovies.index(page, limit);
      if (listEntity.isNotEmpty) {
        _addMovies(listEntity);
        _state = UIState.done;
      } else {
        _state = UIState.error;
      }
    } catch (_) {
      _state = UIState.error;
    }
  }

  @override
  void dispose() {}

  // MovieList
  void _addMovies(List<MovieEntity> entities) => runInAction(() {
        movies.addAll(entities);
      }, name: 'Add movie to List of Entities');

  void _clearMovies() => runInAction(() {
        movies.clear();
      }, name: 'Clear all movies');

  // page control
  void _resetPage() => page = 1;
  void _incrementPage() => page++;
}
