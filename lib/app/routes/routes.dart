import 'package:flutter/material.dart';
import 'package:gs3_desafio_flutter/app/design_system/menus/bottom_nav_screen.dart';
import 'package:gs3_desafio_flutter/app/widget/tela_login/pages/screen_login.dart';

class Rotas {
  static const String login = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> definirRotas() {
    return {
      login: (context) => const LoginScreen(),
      home: (context) => const BottomNavScreen(), 
    };
  }
}
