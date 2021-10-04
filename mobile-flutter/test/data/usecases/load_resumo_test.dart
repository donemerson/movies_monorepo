@Timeout(Duration(seconds: 30))
@Tags(['usercases', 'movies'])

import 'package:movies_flix/mocks/local_mock_load_movie.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movies_flix/app/data/data.dart';
import 'package:movies_flix/app/domain/domain.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'load_resumo_test.mocks.dart';

@GenerateMocks([HttpClient])
void main() {
  late final LoadMovies usercase;
  late final MockHttpClient httpClient;

  setUpAll(() {
    httpClient = MockHttpClient();
    usercase =
        RemoteLoadMovies(httpClient: httpClient, url: 'wwww.google.com.br');
  });

  PostExpectation<Future<dynamic>> mockRequest() => when(httpClient.request(
        body: anyNamed('body'),
        headers: anyNamed('headers'),
        method: anyNamed('method'),
        queryParams: anyNamed('queryParams'),
        url: anyNamed('url'),
      ));

  void mockRequestData(Map data) {
    mockRequest().thenAnswer((_) async => data);
  }

  void mockRequestThrow(HttpError error) async =>
      mockRequest().thenThrow(error);

  group('LoadMovies.index:', () {
    test('Deveria retornar lista de entity', () async {
      mockRequestData(LocalMockLoadMovie.indexResponse);

      final lista = await usercase.index(1, 10);

      expect(lista.length,
          equals(LocalMockLoadMovie.indexResponse['data'].length));
    });

    test(
      'Deveria retornar erro de dominio',
      () async {
        mockRequestThrow(HttpError.badRequest);

        late Object error;

        try {
          error = await usercase.index(1, 10);
        } catch (e) {
          error = e;
        }

        expect(error, DomainError.unexpected);
      },
    );
  });

  group('LoadMovies.show:', () {
    test('Deveria retornar um entity', () async {
      mockRequestData(LocalMockLoadMovie.showResponse);

      final entity = await usercase.show(1);

      expect(entity, isNotNull);
      expect(entity, isA<MovieEntity>());
    });

    test(
      'Deveria retornar erro de dominio',
      () async {
        mockRequestThrow(HttpError.badRequest);

        late Object error;

        try {
          error = await usercase.show(1);
        } catch (e) {
          error = e;
        }

        expect(error, DomainError.unexpected);
      },
    );
  });

  group('LoadMovies.store:', () {
    test('Deveria cadastrar ', () async {
      mockRequestData(LocalMockLoadMovie.storeUpdateResponse);
      final entityPayload = RemoteMutationMovieModel.fromJson(
              LocalMockLoadMovie.storeUpdatePayload)
          .toEntity();
      late bool ok;
      await usercase
          .store(entityPayload)
          .then((value) => ok = true)
          .onError((error, stackTrace) => ok = false);

      expect(ok, true);
    });

    test(
      'Deveria retornar erro de dominio',
      () async {
        mockRequestThrow(HttpError.badRequest);
        final entityPayload = RemoteMutationMovieModel.fromJson(
                LocalMockLoadMovie.storeUpdatePayload)
            .toEntity();
        late Object error;

        try {
          await usercase.store(entityPayload);
        } catch (e) {
          error = e;
        }

        expect(error, isNotNull);
        expect(error, DomainError.unexpected);
      },
    );
  });

  group('LoadMovies.update:', () {
    test('Deveria atualizar ', () async {
      mockRequestData(LocalMockLoadMovie.storeUpdateResponse);
      final entityPayload = RemoteMutationMovieModel.fromJson(
              LocalMockLoadMovie.storeUpdatePayload)
          .toEntity();
      late bool ok;
      await usercase
          .update(2, entityPayload)
          .then((value) => ok = true)
          .onError((error, stackTrace) => ok = false);

      expect(ok, true);
    });

    test(
      'Deveria retornar erro de dominio',
      () async {
        mockRequestThrow(HttpError.badRequest);
        final entityPayload = RemoteMutationMovieModel.fromJson(
                LocalMockLoadMovie.storeUpdatePayload)
            .toEntity();
        late Object error;

        try {
          await usercase.update(2, entityPayload);
        } catch (e) {
          error = e;
        }

        expect(error, isNotNull);
        expect(error, DomainError.unexpected);
      },
    );
  });
}
