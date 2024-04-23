import 'package:dio/dio.dart';
import 'package:hotel_pra_hoje/src/core/domain/usecases/credential/get_credential_usecase.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/result.dart';

//* Essa classe permite interceptar as requisições HTTP antes de serem enviadas p/ API
class AuthInterceptor extends InterceptorsWrapper {
  final IGetCredentialUsecase getCredentialUsecase;

  AuthInterceptor({required this.getCredentialUsecase});

  //* Esse método é sempre chamado antes de cada requisição
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final response = await getCredentialUsecase();
    if (response.isSuccess) {
      final dto = response.getSuccess;
      //* Adiciona um novo cabecalho autenticado com o token se conter
      options.headers['Authorization'] = 'Bearer ${dto?.token}';
    }

    super.onRequest(options, handler);
  }
}
