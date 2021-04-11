import 'package:flutter/material.dart';
import 'package:mobile_sistem/pages/cadastro.page.dart';
import 'package:mobile_sistem/pages/inicia.page.dart';
import 'package:mobile_sistem/pages/login.page.dart';
import 'package:mobile_sistem/pages/report.page.dart';

class WazeHoleRoutes {
  var routes = <String, WidgetBuilder>{
    "/home": (BuildContext context) => IniciaPage(),
    "/login": (BuildContext context) => LoginPage(),
    "/report": (BuildContext context) => ReportPage(),
    "/cadastro": (BuildContext context) => CadastroPage(),
  };
}

class WazeHoleNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }

  static void goToReport(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/report");
  }

  static void goToResiter(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/cadastra");
  }
}
