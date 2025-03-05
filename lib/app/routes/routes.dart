import 'package:flutter/material.dart';
import 'package:gs3_desafio_flutter/app/widget/home/home.dart';
import 'package:gs3_desafio_flutter/app/widget/tela_login/pages/screen_login.dart';


class Rotas {
  static const String login = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> definirRotas() {
    return {
      login: (context) => const LoginScreen(),
      home: (context) => const HomePage(),
    };
  }
}
