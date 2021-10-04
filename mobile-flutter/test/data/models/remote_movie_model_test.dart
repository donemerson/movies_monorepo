@Tags(['models', 'movies'])

import 'package:movies_flix/app/data/data.dart';
import 'package:movies_flix/app/domain/domain.dart';
import 'package:movies_flix/mocks/local_mock_load_movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RemoteMovieModel model;

  setUpAll(() {
    model = RemoteMovieModel.fromJson(LocalMockLoadMovie.showResponse['data']);
  });

  group('Model movies', () {
    test('Deveria instanciar a partir de json', () {
      expect(model, allOf(isNotNull, isA<RemoteMovieModel>()));
    });

    test('Deveria atribuir valores corretamente', () {
      expect(model.id,
          allOf(equals(LocalMockLoadMovie.showResponse['data']['id'])));
    });

    test('Deveria retornar uma entidade', () {
      final entity = model.toEntity();
      expect(entity, isNotNull);
      expect(entity, isA<MovieEntity>());
    });
    test('Deveria retornar um json', () {
      final json = model.toJson();
      expect(json, isNotNull);
      expect(json, isA<Map>());
    });
  });
}
