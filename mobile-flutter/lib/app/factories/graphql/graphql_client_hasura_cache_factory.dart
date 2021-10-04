import '../../data/data.dart';
import '../../infra/infra.dart';
import '../factories.dart';

GraphQLClientCache makeGraphQLAdapterHasuraCache() {
  return GraphQLAdapterCache(
    makeGraphQLAdapterHasura(),
    makeDBAdapter(),
    makeUuidAdapter(),
  );
}
