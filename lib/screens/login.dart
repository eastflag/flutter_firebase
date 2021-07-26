import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            title: Text('Eastflag')
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(color: Colors.red),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 200, height: 200, color: Colors.amber),
                Stack(
                  children: [
                    Container(width: 200, height: 200, color: Colors.cyan),
                    Container(width: 100, height: 100, color: Colors.black),
                  ],
                ),
                Container(height: size.height * 0.1),
                Text('Sign Up'),
                Container(height: size.height * 0.05),
              ],
            )
          ],
        )
    );
  }
}
