import 'dart:async';
import 'package:movies_flix/app/data/data.dart';
import 'package:mobx/mobx.dart';
import '../../domain/domain.dart';
import '../../ui/ui.dart';

class StoreMovieDetailsPresenter implements MovieDetailsPresenter {
  final LoadMovies _loadMovies;

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
    _movieEntity = Observable(movieEntity);
  }

  @override
  Future<void> rate(int value) async {
    final _userEntity = await localUser.load();
    final _model = RemoteMovieModel.fromEntity(entity);
    _model.rating.add(
      RemoteRatingModel(
        user: RemoteUserModel.fromEntity(_userEntity!),
        value: value,
      ),
    );
    runInAction(() {
      _movieEntity.value = _model.toEntity();
    });
    _loadMovies.rating(entity.id, value);
  }

  @override
  Future<void> comment(String value) async {
    final _userEntity = await localUser.load();
    final _model = RemoteMovieModel.fromEntity(entity);
    _model.comment.add(
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
}
