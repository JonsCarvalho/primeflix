import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:primeflix/app/shared/utils/constants.dart';
import 'package:primeflix/app/modules/login/login_controller.dart';
import 'movies_repository.dart';
import 'components/navigation_bar/navigation_bar_controller.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
        $NavigationBarController,
        $LoginController,
        Bind((i) => MoviesRepository(i.get<DioForNative>())),
        Bind((i) => DioForNative(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
