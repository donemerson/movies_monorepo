@Tags(['factory'])

import 'package:movies_flix/app/data/data.dart';
import 'package:movies_flix/app/factories/factories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory Make GraphQLClient:', () {
    test('Deveria instanciar um GraphQLClient', () async {
      final graphQLClient = makeGraphQLAdapter();
      expect(graphQLClient, isNotNull);
      expect(graphQLClient, isA<GraphQLClient>());
    });
    test('Deveria instanciar um GraphQLClient Cache', () async {
      final graphQLClient = makeGraphQLAdapterCache();
      expect(graphQLClient, isNotNull);
      expect(graphQLClient, isA<GraphQLClient>());
      expect(graphQLClient, isA<GraphQLClientCache>());
    });
    test('Deveria instanciar um GraphQLClient Hasura', () async {
      final graphQLClient = makeGraphQLAdapterHasura();
      expect(graphQLClient, isNotNull);
      expect(graphQLClient, isA<GraphQLClient>());
    });
    test('Deveria instanciar um GraphQLClient Hasura Cache', () async {
      final graphQLClient = makeGraphQLAdapterHasuraCache();
      expect(graphQLClient, isNotNull);
      expect(graphQLClient, isA<GraphQLClient>());
      expect(graphQLClient, isA<GraphQLClientCache>());
    });
  });
}
