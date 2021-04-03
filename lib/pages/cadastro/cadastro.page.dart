import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _pass = new TextEditingController();
  final TextEditingController _nome = new TextEditingController();
  final TextEditingController _conf_pass = new TextEditingController();

  String get username => _email.text;
  String get password => _pass.text;

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
            children: [
              Container(
                height: 25,
              ),
              TextFormField(
                controller: _nome,
                autofocus: true,
                keyboardType: TextInputType.name,
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nome",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                height: 25,
              ),
              TextFormField(
                controller: _email,
                autofocus: true,
                keyboardType: TextInputType.name,
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                height: 25,
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
                height: 25,
              ),
              TextFormField(
                controller: _conf_pass,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.name,
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Confirme a senha",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                height: 125,
              ),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: () {
                    if (_pass != '' || _conf_pass != '') {
                      if (_pass == _conf_pass) {
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("As senha não são iguais"),
                          backgroundColor: Colors.redAccent,
                        ));
                      }
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Insira uma senha"),
                        backgroundColor: Colors.redAccent,
                      ));
                    }
                  }, //Função de pressionar, função atribuida ao botão
                  child: Text(
                    "Confirmar",
                    style: TextStyle(color: Colors.green[300]),
                  ),
                  color: Colors.white,
                ),
              ),
              Container(
                height: 25,
              ),
              Center(
                child: GestureDetector(
                  child: Text(
                      'Já tem conta?'
                      ' Entre',
                      style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.of(context).pushNamed("/");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
