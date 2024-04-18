class DatasourceException implements Exception{
  final String message;
  final Map? data;
  DatasourceException(this.message, [this.data]);
}
