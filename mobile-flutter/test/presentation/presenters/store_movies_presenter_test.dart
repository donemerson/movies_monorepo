import 'package:movies_flix/app/data/data.dart';
import 'package:movies_flix/app/domain/domain.dart';
import 'package:movies_flix/app/factories/network_cache/network_cache.dart';
// ignore: unused_import
import 'package:movies_flix/app/factories/usercases/local_user_factory.dart';
import 'package:movies_flix/app/factories/usercases/logoft_user_factory.dart';
import 'package:movies_flix/app/presentation/presentation.dart';
import 'package:movies_flix/app/ui/helpers/helpers.dart';
import 'package:movies_flix/app/ui/pages/pages.dart';
import 'package:movies_flix/mocks/local_mock_load_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'store_movies_presenter_test.mocks.dart';

@GenerateMocks([BuildContext])
@GenerateMocks([LoadMovies])
void main() {
  late MoviesPresenter presenter;
  final loadMovies = MockLoadMovies();

  setUp(() {
    presenter = StoreMoviesPresenter(
        loadMovies, makeNetworkCacheClient(), makeRemoteLogoftUser());
  });

  tearDown(() {
    presenter.dispose();
  });

  PostExpectation<Future<List<MovieEntity>>> mockRequestIndex() =>
      when(loadMovies.index(any, any));

  void mockData<T>(T data, PostExpectation<Future<T>> postExpectation) {
    postExpectation.thenAnswer((_) async => data);
  }

  void mockThrow(DomainError error, PostExpectation postExpectation) async =>
      postExpectation.thenThrow(error);

  void mockIndex() => mockData<List<MovieEntity>>(
      List.generate(
        LocalMockLoadMovie.indexResponse['data'].length,
        (index) => RemoteMovieModel.fromJson(
          LocalMockLoadMovie.indexResponse['data'][index],
        ).toEntity(),
      ),
      mockRequestIndex());

  group('StoreMoviesPresenter.reload: ', () {
    test(
      'Deveria ter uma lista de MoviesEntity',
      () async {
        mockIndex();
        await presenter.reload();
        expect(presenter.movies, isNotEmpty);
        expect(presenter.movies, isA<List<MovieEntity>>());
      },
    );

    test(
      'Deveria estar com status carregando para error',
      () async {
        mockThrow(DomainError.unexpected, mockRequestIndex());
        expect(presenter.state, equals(UIState.loading));
        await presenter.reload();
        expect(presenter.state, equals(UIState.error));
        expect(presenter.movies.length, 0);
      },
    );
  });

  group('StoreMoviesPresenter.index: ', () {
    test(
      'Deveria estar com status carregando para carregado',
      () async {
        mockIndex();

        expect(presenter.state, equals(UIState.loading));
        await presenter.index();
        expect(presenter.state, equals(UIState.done));
      },
    );

    test(
      'Deveria estar com status carregando para error',
      () async {
        mockThrow(DomainError.unexpected, mockRequestIndex());
        expect(presenter.state, equals(UIState.loading));
        await presenter.index();
        expect(presenter.state, equals(UIState.error));
        expect(presenter.movies.length, 0);
      },
    );
    test(
      'Deveria ter uma lista de MoviesEntity',
      () async {
        mockIndex();
        await presenter.index();
        expect(presenter.movies, isNotEmpty);
        expect(presenter.movies, isA<List<MovieEntity>>());
      },
    );
  });
}
