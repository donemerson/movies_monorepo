import 'package:movies_flix/app/infra/infra.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const namespace = '4f80a356-1f2e-11ec-9621-0242ac130002';
  final uuidClient = UuidAdapter(namespace);

  group('UuidClient:', () {
    test('Deveria retornar um uuid valido', () async {
      const string1 = '   anything  ';
      const string2 = 'anything';
      const esperado = 'd7d0e224-86e5-5900-9991-ccdf3124b63f';

      expect(esperado, equals(uuidClient.generate(string1)));
      expect(esperado, equals(uuidClient.generate(string2)));
    });
  });
}
