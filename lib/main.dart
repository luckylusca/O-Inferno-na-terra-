import 'package:flutter/material.dart';
import 'package:mobile_sistem/models/controller.page.dart';
import 'package:mobile_sistem/views/cadastro.page.dart';
import 'package:mobile_sistem/views/inicia.page.dart';
import 'package:mobile_sistem/views/login.page.dart';

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
