import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/navigation_bar/navigation_bar_controller.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final navigationBarController = Modular.get<NavigationBarController>();

  @observable
  PageController pageController;

  @action
  setPageController(value) => pageController.jumpToPage(value);

  @action
  setNavigatorController(value) {
    navigationBarController.navagationComponentClick(value);
  }
}
