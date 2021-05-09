import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'navigation_bar_controller.g.dart';

@Injectable()
class NavigationBarController = _NavigationBarBase
    with _$NavigationBarController;

abstract class _NavigationBarBase with Store {
  @observable
  int indexComponentSelected = 0;

  _NavigationBarBase();

  @action
  navagationComponentClick(int index) {
    indexComponentSelected = index;
  }
}
