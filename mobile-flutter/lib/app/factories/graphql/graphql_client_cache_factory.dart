import '../../data/data.dart';
import '../../infra/infra.dart';
import '../factories.dart';

GraphQLClientCache makeGraphQLAdapterCache() {
  return GraphQLAdapterCache(
    makeGraphQLAdapter(),
    makeDBAdapter(),
    makeUuidAdapter(),
  );
}
