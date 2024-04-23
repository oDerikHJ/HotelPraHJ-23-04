import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hotel_pra_hoje/src/app_configuration.dart';
import 'package:hotel_pra_hoje/src/core/domain/repositories/i_credential_repository.dart';
import 'package:hotel_pra_hoje/src/core/domain/usecases/credential/get_credential_usecase.dart';
import 'package:hotel_pra_hoje/src/core/domain/usecases/credential/remove_credential_usecase.dart';
import 'package:hotel_pra_hoje/src/core/domain/usecases/credential/save_credential_usecase.dart';
import 'package:hotel_pra_hoje/src/core/externals/datasources/local/local_datasource.dart';
import 'package:hotel_pra_hoje/src/core/infrastructure/datasources/i_local_datasource.dart';
import 'package:hotel_pra_hoje/src/core/infrastructure/interceptors/auth_interceptor.dart';
import 'package:hotel_pra_hoje/src/core/infrastructure/repositories/credential_repository.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/http/http.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/http/i_http.dart';
import 'package:hotel_pra_hoje/src/modules/main/main_module.dart';
import 'package:hotel_pra_hoje/src/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    //* credential
    i.add<ILocalDatasource>(() => LocalDatasource());
    i.add<ICredentialRepository>(() => CredentialRepository(datasource: i()));
    i.add<IGetCredentialUsecase>(() => GetCredentialUsecase(repository: i()));
    i.add<ISaveCredentialUsecase>(() => SaveCredentialUsecase(repository: i()));
    i.add<IRemoveCredentialUsecase>(() => RemoveCredentialUsecase(repository: i()));

    //* http
    i.add(
      () => Dio(
        BaseOptions(
          baseUrl: kBaseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      ),
    );
    i.add<IHttp>(
      () => Http(clientHttp: i(), interceptor: [
        AuthInterceptor(getCredentialUsecase: i()),
      ]),
    );
  }

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module('/main', module: MainModule(), transition: TransitionType.scale);
  }
}
