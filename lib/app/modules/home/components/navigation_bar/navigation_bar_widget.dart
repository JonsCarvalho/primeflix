import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../home_controller.dart';
import 'navigation_bar_controller.dart';
import 'navigation_component_widget.dart';

class NavigationBarWidget extends StatelessWidget {
  final HomeController homeController = Modular.get();
  final NavigationBarController navigationBarController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 10.0 : 0),
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInCubic,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 6.0,
            spreadRadius: 0.5,
            offset: Offset(
              0.0,
              3.0,
            ),
          )
        ],
      ),
      height: Platform.isIOS ? 70 : 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: NavigationComponentWidget(
              icon: LineAwesomeIcons.home,
              index: 0,
              title: 'Início',
              homeController: homeController,
              navigationBarController: navigationBarController,
            ),
          ),
          Expanded(
            child: NavigationComponentWidget(
              icon: LineAwesomeIcons.search,
              index: 1,
              title: 'Busca',
              homeController: homeController,
              navigationBarController: navigationBarController,
            ),
          ),
          Expanded(
            child: NavigationComponentWidget(
              icon: LineAwesomeIcons.user,
              index: 2,
              title: 'Perfil',
              homeController: homeController,
              navigationBarController: navigationBarController,
            ),
          ),
        ],
      ),
    );
  }
}
