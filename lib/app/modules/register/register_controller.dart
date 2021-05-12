import 'package:cool_alert/cool_alert.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primeflix/app/modules/login/login_controller.dart';
import 'register_repository.dart';

part 'register_controller.g.dart';

@Injectable()
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  var loginController = Modular.get<LoginController>();
  final registerRepository = Modular.get<RegisterRepository>();

  @computed
  bool get isValid {
    return (validateName() == null &&
            validateEmail() == null &&
            validatePassword() == null &&
            validateConfirmPassword() == null) &&
        (name != null &&
            email != null &&
            password != null &&
            confirmPassword != null);
  }

  @computed
  bool get loading => registerState == RegisterState.LOADING;

  @observable
  RegisterState registerState;

  @observable
  String name;

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  String email;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  String password;

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  String confirmPassword;

  @observable
  TextEditingController confirmPasswordController = TextEditingController();

  @observable
  bool obscurePassword = true;

  @action
  setName(value) => name = value;

  @action
  setEmail(value) => email = value;

  @action
  setPassword(value) => password = value;

  @action
  setConfirmPassword(value) => confirmPassword = value;

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

  String validateName() {
    if (name == null) {
      return null;
    } else if (name.isEmpty) {
      return 'Este campo é obrigatório.';
    } else if (name.length <= 3) {
      return "Insira um nome válido!";
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

  String validateConfirmPassword() {
    if (confirmPassword == null) {
      return null;
    } else if (confirmPassword.isEmpty) {
      return 'Este campo é obrigatório.';
    } else if (confirmPassword != password) {
      return 'As senhas não conferem.';
    }

    return null;
  }

  @action
  register(context) async {
    registerState = RegisterState.LOADING;

    var result = await registerRepository.register(
        name: name, email: email, password: password);

    if (result.statusCode == 400) {
      registerState = RegisterState.FAIL_NOT_REGISTERED;
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
    } else if (result.statusCode != 200 && result.statusCode != 400) {
      registerState = RegisterState.FAIL;
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

    if (result.data != null) {
      registerState = RegisterState.SUCCESS;
      return CoolAlert.show(
          context: context,
          title: 'Sucesso!',
          confirmBtnColor: Theme.of(context).primaryColor,
          borderRadius: 15,
          type: CoolAlertType.success,
          text: 'Usuário criado com sucesso! Deseja realizar o login?',
          onConfirmBtnTap: () async {
            Modular.to.pop();
            await loginController.signInWithEmailAndPassword(
                email, password, context);
          },
          confirmBtnText: 'Login',
          cancelBtnText: 'Voltar',
          showCancelBtn: true,
          onCancelBtnTap: () {
            Modular.to.pop();
          });
    }
  }
}

enum RegisterState { IDLE, SUCCESS, FAIL_NOT_REGISTERED, FAIL, LOADING }
