import 'package:dio/native_imp.dart';
import 'package:primeflix/app/shared/utils/constants.dart';

import 'login_repository.dart';
import 'package:dio/dio.dart';
import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $LoginController,
        Bind((i) => LoginRepository(i.get<DioForNative>())),
        Bind((i) => DioForNative(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
