import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/input_field_widget.dart';
import 'components/login_button.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final EdgeInsets _horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            header(),
            SizedBox(height: 15),
            inputLogin(),
            SizedBox(height: 15),
            loginButton(),
            SizedBox(height: 15),
            signUp(),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  header() {
    return Padding(
      padding: _horizontalPadding,
      child: Center(
        child: Container(
          height: 200,
          child: Text(
            'primeflix',
            style: GoogleFonts.bebasNeue(
              color: Theme.of(context).primaryColor,
              fontSize: 60,
            ),
          ),
        ),
      ),
    );
  }

  signUp() {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/register');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Primeira vez aqui?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.right,
              ),
              Text(
                " Cadastre-se com seu e-mail",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }

  inputLogin() {
    return Padding(
      padding: _horizontalPadding,
      child: Column(
        children: [
          Observer(builder: (_) {
            return InputFieldWidget(
              hint: "E-mail",
              controller: controller.loginClient.emailController,
              icon: Icons.email,
              inputType: TextInputType.emailAddress,
              obscure: false,
              onChanged: controller.loginClient.setEmail,
              errorText: controller.loginClient.validateEmail,
            ).build();
          }),
          SizedBox(height: 15),
          Observer(builder: (_) {
            return InputFieldWidget(
                hint: "Senha",
                controller: controller.loginClient.passwordController,
                icon: Icons.lock_outline,
                inputType: TextInputType.text,
                obscure: controller.loginClient.obscurePassword,
                onChanged: controller.loginClient.setPassword,
                onObscure: controller.loginClient.changeObscurePassword,
                errorText: controller.loginClient.validatePassword,
                suffix: FlatButton(
                  onPressed: controller.loginClient.changeObscurePassword,
                  child: Icon(
                    controller.loginClient.obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )).build();
          }),
        ],
      ),
    );
  }

  loginButton() {
    // return Padding(
    //   padding: _horizontalPadding,
    //   child: Observer(builder: (_) {
    //     return InkWell(
    //       onTap: (){
    //         controller.signInWithEmailAndPassword(
    //           controller.loginClient.email,
    //           controller.loginClient.password,
    //           context,
    //         );
    //         Modular.to.pushReplacementNamed('/home');
    //       },
    //       child: Container(
    //         height: 45,
    //         width: 150,
    //         color: Colors.orange,
    //       ),
    //     );
    return Padding(
      padding: _horizontalPadding,
      child: Observer(builder: (_) {
        return LoginButton(
          text: 'Entrar',
          onPressed: () {
            FocusScope.of(context).unfocus();
            controller.signInWithEmailAndPassword(
              controller.loginClient.email,
              controller.loginClient.password,
              context,
            );
          },
          isValid: controller.loginClient.isValid,
          loading: controller.loading,
        );
      }),
    );
    //}),
    // );
  }
}
