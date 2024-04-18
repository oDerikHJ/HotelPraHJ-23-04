class HttpResponse<T> {
  final T data;
  final int statusCode;

  HttpResponse({required this.data, required this.statusCode});
}
