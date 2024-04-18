import 'package:flutter_modular/flutter_modular.dart';
import 'package:hotel_pra_hoje/src/modules/main/views/favorites/favorite_view.dart';
import 'package:hotel_pra_hoje/src/modules/main/views/home/views/home_view.dart';
import 'package:hotel_pra_hoje/src/modules/main/views/navigation_page/navigation_page.dart';
import 'package:hotel_pra_hoje/src/modules/main/views/profile/profile_view.dart';
import 'package:hotel_pra_hoje/src/modules/main/views/search/search_view.dart';

class MainModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const NavigationPage(),
      children: [
        ChildRoute('/home', child: (_) => const HomeView()),
        ChildRoute('/favorites', child: (_) => const FavoriteView()),
        ChildRoute('/search', child: (_) => const SearchView()),
        ChildRoute('/profile', child: (_) => const ProfileView()),
      ],
    );
  }
}
