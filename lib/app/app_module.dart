import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:primeflix/app/app_widget.dart';
import 'package:primeflix/app/modules/home/home_module.dart';

import 'modules/login/login_module.dart';
import 'modules/movie/movie_module.dart';
import 'modules/profile/profile_module.dart';
import 'modules/register/register_module.dart';
import 'modules/search/search_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SplashModule()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/register', module: RegisterModule()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/movie', module: MovieModule()),
        ModularRouter('/profile', module: ProfileModule()),
        ModularRouter('/search', module: SearchModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
