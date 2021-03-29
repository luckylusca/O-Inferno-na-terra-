import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/inicia.page.dart';

class posLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("zzzz"),
              accountEmail: Text("Ex@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("ZZ"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Minha conta"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text("Realizar denúncia"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => IniciatPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Desconectar"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
