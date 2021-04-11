import 'package:flutter/material.dart';
import 'package:mobile_sistem/controladores/provider/user_provider.dart';
import 'package:mobile_sistem/controladores/router.dart';
import 'package:mobile_sistem/controladores/users.dart';
import 'package:provider/provider.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _pass = new TextEditingController();
  final TextEditingController _confPass = new TextEditingController();

  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 25,
                ),
                TextFormField(
                  autofocus: true,
                  style: new TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nome inválido';
                    }

                    if (value.trim().length < 3) {
                      return 'Nome muito curto. No mínimo 3 letras';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value,
                ),
                Container(
                  height: 25,
                ),
                TextFormField(
                  autofocus: true,
                  style: new TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "E-mail",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email inválido';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['email'] = value,
                ),
                Container(
                  height: 25,
                ),
                TextFormField(
                  autofocus: true,
                  style: new TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "URL do Avatar",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  onSaved: (value) => _formData['avatarUrl'] = value,
                ),
                Container(
                  height: 25,
                ),
                TextFormField(
                  controller: _pass,
                  autofocus: true,
                  obscureText: true,
                  style: new TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Senha inválido';
                    }

                    if (value.trim().length < 6) {
                      return 'Senha muito curta. No mínimo 6 letras';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['senha'] = value,
                ),
                Container(
                  height: 25,
                ),
                TextFormField(
                  controller: _confPass,
                  autofocus: true,
                  obscureText: true,
                  style: new TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirme a senha",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Senha inválido';
                    }

                    if (value.trim().length < 6) {
                      return 'Senha muito curta. No mínimo 6 letras';
                    }
                    return null;
                  },
                ),
                Container(
                  height: 125,
                ),
                ButtonTheme(
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_pass == _confPass) {
                        final isValid = _form.currentState.validate();

                        if (isValid) {
                          _form.currentState.save();

                          Provider.of<Users>(context, listen: false).put(User(
                              id: _formData['id'],
                              name: _formData['name'],
                              email: _formData['email'],
                              avatarUrl: _formData['avatarUrl'],
                              senha: _formData['senha']));

                          WazeHoleNavigator.goToLogin(context);
                        }
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("As senhas não são iguais"),
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
                    child: Text('Já tem conta? Entre',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      WazeHoleNavigator.goToLogin(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
