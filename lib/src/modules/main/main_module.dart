import 'package:flutter_modular/flutter_modular.dart';
import 'package:hotel_pra_hoje/src/modules/main/domain/repositories/i_home_repository.dart';
import 'package:hotel_pra_hoje/src/modules/main/domain/usecases/get_hotels_usecase.dart';
import 'package:hotel_pra_hoje/src/modules/main/externals/home_datasource.dart';
import 'package:hotel_pra_hoje/src/modules/main/infrastructure/datasources/i_home_datasource.dart';
import 'package:hotel_pra_hoje/src/modules/main/infrastructure/repositories/home_repository.dart';
import 'package:hotel_pra_hoje/src/modules/main/ui/favorites/favorite_view.dart';
import 'package:hotel_pra_hoje/src/modules/main/ui/home/controllers/home_controller.dart';
import 'package:hotel_pra_hoje/src/modules/main/ui/home/views/home_view.dart';
import 'package:hotel_pra_hoje/src/modules/main/ui/navigation_page/navigation_page.dart';
import 'package:hotel_pra_hoje/src/modules/main/ui/profile/profile_view.dart';
import 'package:hotel_pra_hoje/src/modules/main/ui/search/search_view.dart';

class MainModule extends Module {
  @override
  void binds(Injector i) {
    //* datasources
    i.add<IHomeDatasource>(() => HomeDatasource(http: i()));

    //* repositories
    i.add<IHomeRepository>(() => HomeRepository(datasource: i()));

    //* usecases
    i.add<IGetHotelsUsecase>(() => GetHotelsUsecase(repository: i()));

    //* controllers
    i.add(() => HomeController(getHotelsUsecase: i()));
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const NavigationPage(),
      children: [
        ChildRoute('/home', child: (_) => HomeView(controller: Modular.get())),
        ChildRoute('/favorites', child: (_) => const FavoriteView()),
        ChildRoute('/search', child: (_) => const SearchView()),
        ChildRoute('/profile', child: (_) => const ProfileView()),
      ],
    );
  }
}
