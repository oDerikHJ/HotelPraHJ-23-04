import 'package:flutter_modular/flutter_modular.dart';
import 'package:hotel_pra_hoje/src/modules/main/main_module.dart';
import 'package:hotel_pra_hoje/src/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    
  }

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module('/main', module: MainModule(), transition: TransitionType.scale);
  }
}
