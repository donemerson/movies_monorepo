import '../../data/data.dart';
import '../../infra/infra.dart';

const String _namespace = '4f80a356-1f2e-11ec-9621-0242ac130002';
UuidClient makeUuidAdapter() => UuidAdapter(_namespace);
