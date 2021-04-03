import 'package:flutter/material.dart';

import 'pages/login/login.page.dart';
import 'controladores/controller.dart';
import 'pages/cadastro/cadastro.page.dart';
import 'pages/inicio/inicia.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ControllerPage.instace,
      builder: (context, child) {
        return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
              brightness: ControllerPage.instace.dartTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => LoginPage(),
              '/home': (context) => IniciaPage(),
              '/cadastro': (context) => CadastroPage(),
            });
      },
    );
  }
}
