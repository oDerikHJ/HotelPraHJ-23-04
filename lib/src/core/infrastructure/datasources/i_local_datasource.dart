abstract interface class ILocalDatasource {
  Future<T> readString<T>(String key);

  Future<List<Map<String, dynamic>>> readList(String key);

  Future<bool> save<T>(String key, T value);

  Future<bool> saveBool(String key, bool value);

  Future<bool> removeKey(String key);

  Future<bool> clearAll();
}
