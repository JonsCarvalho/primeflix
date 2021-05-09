// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $InputLoginController = BindInject(
  (i) => InputLoginController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InputLoginController on _InputLoginControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_InputLoginControllerBase.isValid'))
      .value;

  final _$emailAtom = Atom(name: '_InputLoginControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$emailControllerAtom =
      Atom(name: '_InputLoginControllerBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$passwordAtom = Atom(name: '_InputLoginControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordControllerAtom =
      Atom(name: '_InputLoginControllerBase.passwordController');

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  final _$obscurePasswordAtom =
      Atom(name: '_InputLoginControllerBase.obscurePassword');

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  final _$_InputLoginControllerBaseActionController =
      ActionController(name: '_InputLoginControllerBase');

  @override
  dynamic setEmail(dynamic value) {
    final _$actionInfo = _$_InputLoginControllerBaseActionController
        .startAction(name: '_InputLoginControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_InputLoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(dynamic value) {
    final _$actionInfo = _$_InputLoginControllerBaseActionController
        .startAction(name: '_InputLoginControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_InputLoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeObscurePassword() {
    final _$actionInfo = _$_InputLoginControllerBaseActionController
        .startAction(name: '_InputLoginControllerBase.changeObscurePassword');
    try {
      return super.changeObscurePassword();
    } finally {
      _$_InputLoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
emailController: ${emailController},
password: ${password},
passwordController: ${passwordController},
obscurePassword: ${obscurePassword},
isValid: ${isValid}
    ''';
  }
}
