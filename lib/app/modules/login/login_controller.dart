import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'input_login_controller.dart';
import 'login_repository.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  var loginClient = InputLoginController();
  final loginRepository = Modular.get<LoginRepository>();

  @computed
  bool get loading => loginState == LoginState.LOADING;

  @observable
  LoginState loginState;

  @action
  signInWithEmailAndPassword(email, password, context) async {
    loginState = LoginState.LOADING;

    var result = await loginRepository.login(email: email, password: password);

    if (result.statusCode == 400) {
      loginState = LoginState.FAIL_NOT_REGISTERED;
      CoolAlert.show(
        context: context,
        title: 'Erro',
        confirmBtnColor: Theme.of(context).primaryColor,
        borderRadius: 15,
        type: CoolAlertType.error,
        text: result.statusMessage,
        onConfirmBtnTap: () {
          Modular.to.pop();
        },
      );
    } else if (result.statusCode != 200) {
      loginState = LoginState.FAIL;
      CoolAlert.show(
        context: context,
        title: 'Erro',
        confirmBtnColor: Theme.of(context).primaryColor,
        borderRadius: 15,
        type: CoolAlertType.error,
        text: result.statusMessage,
        onConfirmBtnTap: () {
          Modular.to.pop();
        },
      );
    }

    if (result.data != null) {
      loginState = LoginState.SUCCESS;

      Modular.to.pushReplacementNamed('/home');
    }
  }
}

enum LoginState { IDLE, SUCCESS, FAIL_NOT_REGISTERED, FAIL, LOADING }
