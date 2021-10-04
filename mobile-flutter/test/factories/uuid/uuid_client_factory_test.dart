import 'package:movies_flix/app/data/data.dart';
import 'package:movies_flix/app/factories/factories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory Make UuidClient:', () {
    test('Deveria instanciar um UuidClient', () async {
      final graphQLClient = makeUuidAdapter();
      expect(graphQLClient, isNotNull);
      expect(graphQLClient, isA<UuidClient>());
    });
  });
}
