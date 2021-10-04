import 'package:movies_flix/app/factories/factories.dart';
import 'package:movies_flix/app/factories/network_cache/network_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory Make MoviesPage:', () {
    late Widget page;
    setUpAll(() {
      page = makeMoviesPage(makeNetworkCacheClient());
    });
    test('Deveria instanciar um Widget', () async {
      expect(page, isNotNull);
      expect(page, isA<Widget>());
    });
  });
}
