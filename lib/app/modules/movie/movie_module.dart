import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:primeflix/app/shared/utils/constants.dart';
import 'movie_repository.dart';
import 'package:primeflix/app/modules/home/home_controller.dart';
import 'movie_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'movie_page.dart';

class MovieModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MovieRepository(i.get<DioForNative>())),
        Bind((i) => DioForNative(BaseOptions(baseUrl: URL_BASE))),
        $MovieController,
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => MoviePage()),
      ];

  static Inject get to => Inject<MovieModule>.of();
}
