import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'input_login_controller.g.dart';

@Injectable()
class InputLoginController = _InputLoginControllerBase
    with _$InputLoginController;

abstract class _InputLoginControllerBase with Store {
  @computed
  bool get isValid {
    return (validateEmail() == null && validatePassword() == null) &&
        (email != null && password != null);
  }

  @observable
  String email;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  String password;

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool obscurePassword = true;

  @action
  setEmail(value) => email = value;

  @action
  setPassword(value) => password = value;

  @action
  changeObscurePassword() => obscurePassword = !obscurePassword;

  String validateEmail() {
    if (email == null) {
      return null;
    } else if (email.isEmpty) {
      return 'Este campo é obrigatório.';
    } else if (!EmailValidator.validate(email)) {
      return "Insira um e-mail válido!";
    }

    return null;
  }

  String validatePassword() {
    if (password == null) {
      return null;
    } else if (password.isEmpty) {
      return 'Este campo é obrigatório.';
    } else if (password.length < 8) {
      return "Senha inválida, deve conter pelo menos 8 caracteres.";
    }

    return null;
  }
}
