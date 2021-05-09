import 'movie_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'movie_page.dart';

class MovieModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $MovieController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => MoviePage()),
      ];

  static Inject get to => Inject<MovieModule>.of();
}
