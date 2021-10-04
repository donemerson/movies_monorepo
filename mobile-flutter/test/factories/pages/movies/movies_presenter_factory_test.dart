import 'package:movies_flix/app/factories/network_cache/network_cache.dart';
import 'package:movies_flix/app/factories/pages/movies/movies_presenter_factory.dart';
import 'package:movies_flix/app/ui/pages/pages.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory Make ResumoPresenter:', () {
    late MoviesPresenter presenter;

    setUpAll(() {
      presenter = makeStoreMoviesPresenter(makeNetworkCacheClient());
    });

    test('Deveria instanciar um MoviesPresenter', () async {
      expect(presenter, isNotNull);
      expect(presenter, isA<MoviesPresenter>());
    });
  });
}
