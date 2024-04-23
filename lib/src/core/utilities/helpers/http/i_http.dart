import 'package:dio/dio.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/http/http_failure.dart';
import 'http_response.dart';

abstract interface class IHttp {
  Future<HttpResponse<T>> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    String? baseUrl,
    Options? options,
    int timeout,
  });

  Future<HttpResponse<T>> post<T>({
    required String endpoint,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    String? baseUrl,
    Options? options,
  });

  Future<HttpResponse<T>> patch<T>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    Options? options,
  });

  Future<HttpResponse<T>> put<T>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    Options? options,
  });

  Future<HttpResponse<T>> delete<T>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    Options? options,
  });

  HttpFailure handleError(Object e);
}
