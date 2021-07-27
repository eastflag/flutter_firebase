import 'package:firebase_app/data/join_or_login.dart';
import 'package:firebase_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ChangeNotifierProvider<JoinOrLogin>(
        create: (_) => JoinOrLogin(),
        child: AuthPage(),
      )
    );
  }

}