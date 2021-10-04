import 'package:movies_flix/app/domain/domain.dart';
import 'package:movies_flix/app/factories/usercases/load_movies_factory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory Make LoadMovies:', () {
    late LoadMovies usercase;
    setUpAll(() {
      usercase = makeRemoteLoadMovies();
    });
    test('Deveria instanciar um caso de uso tipo LoadMovies', () async {
      expect(usercase, isNotNull);
      expect(usercase, isA<LoadMovies>());
    });
  });
}
