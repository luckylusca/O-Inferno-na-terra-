import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[300],
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _email,
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  style: new TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  height: 35,
                ),
                TextFormField(
                  controller: _pass,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.name,
                  style: new TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  height: 50,
                ),
                ButtonTheme(
                  height: 60.0,
                  child: RaisedButton(
                    onPressed:
                        () {}, //Função de pressionar, função atribuida ao botão
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.green[300]),
                    ),
                    color: Colors.white,
                  ),
                ),
                Divider(),
                Center(
                  child: GestureDetector(
                    child: Text('Cadastra-se',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed("/cadastro");
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
