class HttpFailure implements Exception {
  final String message;
  final int? statusCode;
  final Map? data;
  HttpFailure({
    required this.message,
    this.statusCode,
    this.data,
  });

  factory HttpFailure.empty() {
    return HttpFailure(message: '', statusCode: 0, data: null);
  }

  Map<int, String> errors = {
    400: "badRequest",
    401: "unauthorized",
    403: "forbidden",
    404: "notFound",
    408: "requestTimeout",
    422: "unprocessable",
    500: "internalServerError",
    501: "notImplemented",
    502: "badGateway",
    503: "serviceUnavailable",
    504: "gatewayTimeout",
  };

  HttpFailure copyWith({
    String? message,
    int? statusCode,
    dynamic data,
  }) {
    return HttpFailure(
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      data: data ?? this.data,
    );
  }

  factory HttpFailure.fromMap({required Map map}) {
    //! Mudar variável conforme a api retorna
    return HttpFailure(
      message: map['message'],
      statusCode: map['statusCode'],
      data: map['data'],
    );
  }
}
