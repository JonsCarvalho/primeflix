import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:primeflix/app/modules/login/components/input_field_widget.dart';
import 'search_controller.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key key, this.title = "Search"}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Observer(builder: (_) {
              return InputFieldWidget(
                hint: "Buscar filme",
                suffix: Icon(LineAwesomeIcons.search),
                // controller: controller.loginClient.emailController,

                inputType: TextInputType.emailAddress,
                obscure: false,
                // onChanged: controller.loginClient.setEmail,
                // errorText: controller.loginClient.validateEmail,
              ).build();
            }),
          ),
        ],
      ),
    );
  }
}
