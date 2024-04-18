import 'package:dio/src/options.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/http/http_response.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/http/i_http.dart';

class Http implements IHttp {
  @override
  Future<HttpResponse<T>> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    String? baseUrl,
    Options? options,
    int timeout = 30,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<T>> delete<T>({required String endpoint, required data, String? baseUrl, Options? options}) {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<T>> patch<T>({required String endpoint, required data, String? baseUrl, Options? options}) {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<T>> post<T>({
    required String endpoint,
    required data,
    Map<String, dynamic>? queryParameters,
    String? baseUrl,
    Options? options,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<T>> put<T>({required String endpoint, required data, String? baseUrl, Options? options}) {
    throw UnimplementedError();
  }
}
