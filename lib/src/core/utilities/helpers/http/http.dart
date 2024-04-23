import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/http/http_failure.dart';
import 'http_response.dart';
import 'i_http.dart';

//* Classe para requisições HTTP
class Http implements IHttp {
  final Dio clientHttp;
  final List<Interceptor> interceptor;

  Http({required this.clientHttp, this.interceptor = const []}) {
    if (interceptor.isNotEmpty) {
      clientHttp.interceptors.addAll(interceptor);
    }
  }

  //* Método para reaproveitar em chamadas api, seta o endpoint e define os cabeçalhos das requisições
  Dio _build({String? baseUrl}) {
    if (baseUrl != null) {
      clientHttp.options.baseUrl = baseUrl; //* Define endpoint
    }
    clientHttp.options.headers['Accept'] = 'application/json'; //* Informa API que receberá dados em JSON
    clientHttp.options.headers['Content-Type'] = 'application/json'; //* Informa corpo da solicitação está em JSON
    clientHttp.options.headers['connection'] = 'keep-alive'; //* Mantém conexão aberta para novas requisições
    return clientHttp;
  }

  @override
  Future<HttpResponse<T>> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    String? baseUrl,
    Options? options,
    int timeout = 30,
  }) async {
    try {
      final response = await _build(baseUrl: baseUrl)
          .get(
            endpoint,
            options: options,
            queryParameters: queryParameters,
          )
          .timeout(
            Duration(seconds: timeout),
          );
      return HttpResponse(data: response.data, statusCode: response.statusCode!);
    } catch (e) {
      throw handleError(e);
    }
  }

  @override
  Future<HttpResponse<T>> post<T>({
    required String endpoint,
    required data,
    Map<String, dynamic>? queryParameters,
    String? baseUrl,
    Options? options,
  }) async {
    try {
      final response = await _build(baseUrl: baseUrl).post(
        endpoint,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
      return HttpResponse<T>(data: response.data, statusCode: response.statusCode!);
    } catch (e) {
      throw handleError(e);
    }
  }

  @override
  Future<HttpResponse<T>> patch<T>({
    required String endpoint,
    required data,
    String? baseUrl,
    Options? options,
  }) async {
    try {
      final response = await _build(baseUrl: baseUrl).patch(
        endpoint,
        data: data,
        options: options,
      );

      return HttpResponse<T>(data: response.data, statusCode: response.statusCode!);
    } catch (e) {
      throw handleError(e);
    }
  }

  @override
  Future<HttpResponse<T>> put<T>({
    required String endpoint,
    required data,
    String? baseUrl,
    Options? options,
  }) async {
    try {
      final response = await _build(baseUrl: baseUrl).put(
        endpoint,
        data: data,
        options: options,
      );

      return HttpResponse<T>(data: response.data, statusCode: response.statusCode!);
    } catch (e) {
      throw handleError(e);
    }
  }

  @override
  Future<HttpResponse<T>> delete<T>({
    required String endpoint,
    required data,
    String? baseUrl,
    Options? options,
  }) async {
    try {
      final response = await _build(baseUrl: baseUrl).delete(
        endpoint,
        data: data,
        options: options,
      );

      return HttpResponse<T>(data: response.data, statusCode: response.statusCode!);
    } catch (e) {
      throw handleError(e);
    }
  }

  //* Pega o erro que vem da api e trata para cada tipo
  @override
  HttpFailure handleError(Object e) {
    HttpFailure failure = HttpFailure.empty();

    if (e is DioException) {
      if (e.error is SocketException) {
        //* Lida com erros de baixo nível
        failure = failure.copyWith(
          message: e.response?.data['message'] ?? failure.errors[408],
          statusCode: 408, //* requestTimeout (Levou mais tempo que o servidor aguarda)
          data: e.response?.data,
        );
      } else {
        failure = failure.copyWith(
          message: e.response?.data['message'] ?? failure.errors[e.response?.statusCode],
          statusCode: e.response?.statusCode,
          data: e.response?.data,
        );
      }
    } else if (e is TimeoutException) {
      failure = failure.copyWith(
        message: failure.errors[408],
        statusCode: 408,
      );
    } else {
      //* internalServerError - O servidor encontrou uma condição inesperada e não pôde completar a solicitação
      failure = failure.copyWith(message: failure.errors[500], statusCode: 500);
    }

    return failure;
  }
}
