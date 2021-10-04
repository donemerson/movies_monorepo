import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/domain.dart';
import '../../data/data.dart';

class DBAdapter implements DBClient {
  static DBAdapter instance = DBAdapter._privateConstructor();

  DBAdapter._privateConstructor();

  @override
  Future<void> initDB() async {
    try {
      final Directory appDocDir = await getApplicationSupportDirectory();
      String appDocPath = appDocDir.path;

      Hive.init(appDocPath);
    } catch (e) {}
  }

  @override
  Future<Map<String, dynamic>> getData(String cacheKey) async {
    final map = <String, dynamic>{};
    if (await Hive.boxExists(cacheKey)) {
      final box = await Hive.openBox(cacheKey);

      try {
        final value = await box.get(cacheKey);

        if (value is Map) {
          map.addAll(
            value.map<String, dynamic>(
                (key, value) => {'$key': value}.entries.first),
          );
        } else {
          throw DomainError.unexpected;
        }
      } catch (e) {
        throw DomainError.unexpected;
      } finally {
        box.close();
      }
    }

    return map;
  }

  @override
  Future<void> setData(String cacheKey, Map<String, dynamic> data) async {
    final box = await Hive.openBox(cacheKey);
    try {
      await box.put(cacheKey, data);
    } catch (e) {
      // throw DomainError.unexpected;
    } finally {
      box.close();
    }
  }
}
