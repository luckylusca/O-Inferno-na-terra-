import 'package:flutter/material.dart';
import 'package:mobile_sistem/controladores/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'controladores/router.dart';
import 'pages/login.page.dart';

void main() => runApp(new WazeHole());

class WazeHole extends StatefulWidget {
  @override
  _WazeHoleState createState() => _WazeHoleState();
}

class _WazeHoleState extends State<WazeHole> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        routes: WazeHoleRoutes().routes,
      ),
    );
  }
}
