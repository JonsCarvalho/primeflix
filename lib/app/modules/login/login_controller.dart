import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primeflix/app/shared/models/user_model.dart';

import 'input_login_controller.dart';
import 'login_repository.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  var loginClient = InputLoginController();
  final loginRepository = Modular.get<LoginRepository>();

  @observable
  UserModel user;

  @computed
  bool get loading => loginState == LoginState.LOADING;

  @observable
  LoginState loginState;

  @action
  signInWithEmailAndPassword(email, password, context) async {
    loginState = LoginState.LOADING;

    var result;
    try {
      result = await loginRepository.login(email: email, password: password);

      if (result.statusCode == 200) {
        user = UserModel.fromJson(result.data);

        loginState = LoginState.SUCCESS;

        Modular.to.pushReplacementNamed('/home', arguments: {'user': user});
      }

      if (result.statusCode == 400) {
        loginState = LoginState.FAIL_NOT_REGISTERED;
        return CoolAlert.show(
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
        return CoolAlert.show(
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
    } catch (e) {
      loginState = LoginState.FAIL;
      return CoolAlert.show(
        context: context,
        title: 'Erro',
        confirmBtnColor: Theme.of(context).primaryColor,
        borderRadius: 15,
        type: CoolAlertType.error,
        text: 'Usuário não registrado ou senha incorreta!',
        onConfirmBtnTap: () {
          Modular.to.pop();
        },
      );
    }
  }
}

enum LoginState { IDLE, SUCCESS, FAIL_NOT_REGISTERED, FAIL, LOADING }
