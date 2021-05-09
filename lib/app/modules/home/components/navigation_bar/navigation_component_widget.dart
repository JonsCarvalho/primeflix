import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../home_controller.dart';
import 'navigation_bar_controller.dart';

class NavigationComponentWidget extends StatelessWidget {
  final String title;
  final int index;
  final IconData icon;
  final HomeController homeController;
  final NavigationBarController navigationBarController;

  const NavigationComponentWidget(
      {Key key,
      @required this.title,
      @required this.index,
      @required this.icon,
      @required this.homeController,
      @required this.navigationBarController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return InkWell(
          onTap: () async {
            navigationBarController.navagationComponentClick(index);
            homeController.setPageController(index);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInCubic,
                    decoration: BoxDecoration(
                      color: navigationBarController.indexComponentSelected ==
                              index
                          ? Colors.purple[800]
                          : Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple[800].withAlpha(100),
                          blurRadius: 6.0,
                          spreadRadius: 0.5,
                          offset: Offset(
                            0.0,
                            3.0,
                          ),
                        )
                      ],
                    ),
                    height: 2,
                    width:
                        navigationBarController.indexComponentSelected == index
                            ? MediaQuery.of(context).size.width / 3
                            : .1,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                      margin: navigationBarController.indexComponentSelected ==
                              index
                          ? EdgeInsets.only(top: 1)
                          : EdgeInsets.only(top: 4),
                      alignment: Alignment.center,
                      child: Icon(
                        icon,
                        size: navigationBarController.indexComponentSelected ==
                                index
                            ? 26
                            : 22,
                        color: navigationBarController.indexComponentSelected ==
                                index
                            ? Colors.purple[800]
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
