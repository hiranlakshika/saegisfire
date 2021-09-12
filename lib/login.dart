import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:saegisfire/auth_controller.dart';

import 'main.dart';

class LoginScreen extends StatelessWidget {
  final AuthController _authController = AuthController();

  Future<String?> _signUp(LoginData data) async {
    String? response = await _authController.register(data.name, data.password);
    return response;
  }

  Future<String?> _signIn(LoginData data) async {
    String? response = await _authController.login(data.name, data.password);
    return response;
  }

  Future<String?> _recoverPassword(String name) async {
    await _authController.recoverPassword(name);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Saegis',
      onLogin: _signIn,
      onSignup: _signUp,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
