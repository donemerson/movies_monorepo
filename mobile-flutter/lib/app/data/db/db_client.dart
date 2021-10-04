abstract class DBClient {
  Future<Map<String, dynamic>> getData(String cacheKey);
  Future<void> setData(String cacheKey, Map<String, dynamic> data);
  Future<void> initDB();
}
