import 'package:flutter_modular/flutter_modular.dart';
import 'package:hotel_pra_hoje/src/modules/splash/views/splash_view.dart';

class SplashModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const SplashView());
  }
}
