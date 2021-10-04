import 'package:http/http.dart';

import '../../data/data.dart';
import '../../infra/infra.dart';

GraphQLClient makeGraphQLAdapter() {
  return GraphQLAdapter(Client());
}
