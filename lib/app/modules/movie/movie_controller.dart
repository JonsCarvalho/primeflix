import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'movie_controller.g.dart';

@Injectable()
class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
