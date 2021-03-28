import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final TextEditingController _email = new TextEditingController();
final TextEditingController _pass = new TextEditingController();

String get username => _email.text;
String get password => _pass.text;

void register(BuildContext context) async {
  try {
    FirebaseUser user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: username, password: password);
    if (user != null) {
      _email.text = '';
      _pass.text = '';
      Navigator.of(context).pushNamed("/");
    }
  } catch (e) {
    print(e);
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Falha ao criar conta"),
      backgroundColor: Colors.redAccent,
    ));
  }
}

void doLogin(BuildContext context) async {
  try {
    FirebaseUser user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: username, password: password);
    if (user != null) {
      _pass.text = '';
      Navigator.of(context).pushNamed("/home");
    }
  } catch (e) {
    print(e);
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Falha ao realizar login"),
      backgroundColor: Colors.redAccent,
    ));
  }
  FocusScope.of(context).requestFocus(new FocusNode());
}
