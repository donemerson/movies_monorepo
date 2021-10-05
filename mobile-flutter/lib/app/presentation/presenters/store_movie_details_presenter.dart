import 'dart:async';
import 'package:movies_flix/app/data/data.dart';
import 'package:mobx/mobx.dart';
import '../../domain/domain.dart';
import '../../ui/ui.dart';

class StoreMovieDetailsPresenter implements MovieDetailsPresenter {
  final LoadMovies _loadMovies;

  late final Observable<UIState> _stateObs;
  @override
  UIState get uiState => _stateObs.value;

  @override
  MovieEntity get entity => _movieEntity.value;
  late final Observable<MovieEntity> _movieEntity;

  @override
  final NetworkCacheClient networkCacheClient;

  final LocalUser localUser;

  StoreMovieDetailsPresenter(
    this._loadMovies,
    this.networkCacheClient,
    MovieEntity movieEntity,
    this.localUser,
  ) {
    _stateObs = Observable<UIState>(UIState.loading, name: 'UIState');

    _movieEntity = Observable(movieEntity);
    _load();
  }

  set _state(UIState value) =>
      runInAction(() => _stateObs.value = value, name: 'setUIState');

  void _load() async {
    try {
      _movieEntity.value = await _loadMovies.show(_movieEntity.value.id);
      _state = UIState.done;
    } catch (e) {
      _state = UIState.error;
    }
  }

  @override
  Future<void> rate(int value) async {
    final _userEntity = await localUser.load();
    var _model = RemoteMovieModel.fromEntity(entity);

    _model.rating.add(
      RemoteRatingModel(
        user: RemoteUserModel.fromEntity(_userEntity!),
        value: value,
      ),
    );
    var json = _model.toJson();
    json['userRating'] = value;
    _model = RemoteMovieModel.fromJson(json);
    runInAction(() {
      _movieEntity.value = _model.toEntity();
    });
    _loadMovies.rating(entity.id, value);
  }

  @override
  Future<void> comment(String value) async {
    final _userEntity = await localUser.load();
    final _model = RemoteMovieModel.fromEntity(entity);
    _model.comment.insert(
      0,
      RemoteCommentModel(
        user: RemoteUserModel.fromEntity(_userEntity!),
        value: value,
      ),
    );
    runInAction(() {
      _movieEntity.value = _model.toEntity();
    });
    _loadMovies.comment(entity.id, value);
  }

  @override
  void dispose() {}

  @override
  Future<void> updateTitle(String title) async {
    final _modelMutation = RemoteMutationMovieModel(title: title);
    _loadMovies.update(entity.id, _modelMutation.toEntity());

    var _model = RemoteMovieModel.fromEntity(entity);
    final json = _model.toJson();
    json['title'] = title;
    _model = RemoteMovieModel.fromJson(json);
    runInAction(() {
      _movieEntity.value = _model.toEntity();
    }, name: 'update movie title');
  }

  @override
  Future<void> delete(int id) async {
    _state = UIState.loading;
    await _loadMovies.destroy(id);
  }
}
