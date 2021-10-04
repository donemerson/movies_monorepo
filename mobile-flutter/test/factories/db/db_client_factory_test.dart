@Tags(['factory'])

import 'package:movies_flix/app/data/data.dart';
import 'package:movies_flix/app/factories/factories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory Make DBClient:', () {
    late DBClient dbClient;
    setUpAll(() {
      dbClient = makeDBAdapter();
    });
    test('Deveria instanciar um DBClient', () async {
      expect(dbClient, isNotNull);
      expect(dbClient, isA<DBClient>());
    });
  });
}
