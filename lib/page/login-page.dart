import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'menu-page.dart';

const users = const {
  'user1@gmail.com': '12345',
  'user2@gmail.com': 'clave',
};

class LoginPage extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'usuario no existe';
      }
      if (users[data.name] != data.password) {
        return 'Contraseña incorrecta';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'usuario no existe';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Ganadero App',
      logo: 'assets/fondo.jpeg',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MenuScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
