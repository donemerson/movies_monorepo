import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movies_flix/app/data/data.dart';

SecureStorageAdapter makeSecureStorageAdapter() =>
    SecureStorageAdapter(secureStorage: FlutterSecureStorage());
