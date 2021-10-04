import 'package:http/http.dart';

import '../../data/data.dart';
import '../../infra/infra.dart';

const _secret = String.fromEnvironment('SECRET', defaultValue: '');

GraphQLClient makeGraphQLAdapterHasura() {
  return GraphQLAdapter(Client(), {'x-hasura-admin-secret': _secret});
}
