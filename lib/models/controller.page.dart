import 'package:flutter/cupertino.dart';

class ControllerPage extends ChangeNotifier {
  static ControllerPage instace = ControllerPage();

  bool dartTheme = false;
  changeTheme() {
    dartTheme = !dartTheme;
    notifyListeners();
  }
}
