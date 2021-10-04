import 'package:uuid/uuid.dart';
import '../../data/data.dart';

class UuidAdapter implements UuidClient {
  final String namespace;
  final _uuid = Uuid();

  UuidAdapter(this.namespace);
  String generate(String str) {
    return _uuid.v5(namespace, str.trim());
  }
}
