import '../../data/data.dart';
import '../../infra/infra.dart';

DBClient makeDBAdapter() {
  return DBAdapter.instance;
}
