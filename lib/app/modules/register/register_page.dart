import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primeflix/app/modules/login/components/input_field_widget.dart';
import 'package:primeflix/app/modules/login/components/login_button.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  final EdgeInsets _horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de usuários'),
        leading: BackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          inputLogin(),
          SizedBox(height: 15),
          loginButton(),
          SizedBox(height: 15),
        ],
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
              hint: "Nome",
              controller: controller.nameController,
              icon: Icons.person,
              inputType: TextInputType.text,
              obscure: false,
              onChanged: controller.setName,
              errorText: controller.validateName,
            ).build();
          }),
          SizedBox(height: 15),
          Observer(builder: (_) {
            return InputFieldWidget(
              hint: "E-mail",
              controller: controller.emailController,
              icon: Icons.email,
              inputType: TextInputType.emailAddress,
              obscure: false,
              onChanged: controller.setEmail,
              errorText: controller.validateEmail,
            ).build();
          }),
          SizedBox(height: 15),
          Observer(builder: (_) {
            return InputFieldWidget(
              hint: "Senha",
              controller: controller.passwordController,
              icon: Icons.lock_outline,
              inputType: TextInputType.text,
              obscure: controller.obscurePassword,
              onChanged: controller.setPassword,
              onObscure: controller.changeObscurePassword,
              errorText: controller.validatePassword,
              suffix: FlatButton(
                onPressed: controller.changeObscurePassword,
                child: Icon(
                  controller.obscurePassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            ).build();
          }),
          SizedBox(height: 15),
          Observer(builder: (_) {
            return InputFieldWidget(
              hint: "Confirmar senha",
              controller: controller.confirmPasswordController,
              icon: Icons.lock_outline,
              inputType: TextInputType.text,
              obscure: controller.obscurePassword,
              onChanged: controller.setConfirmPassword,
              onObscure: controller.changeObscurePassword,
              errorText: controller.validateConfirmPassword,
              suffix: FlatButton(
                onPressed: controller.changeObscurePassword,
                child: Icon(
                  controller.obscurePassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            ).build();
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
          text: 'Registrar',
          onPressed: () {
            FocusScope.of(context).unfocus();
            controller.register(context);
          },
          isValid: controller.isValid,
          loading: controller.loading,
        );
      }),
    );
    //}),
    // );
  }
}
