import 'package:firebase_app/data/join_or_login.dart';
import 'package:firebase_app/helper/login_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            CustomPaint(
              size: size,
              painter: LoginBackground(isJoin: Provider.of<JoinOrLogin>(context).isJoin)
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset("assets/images/loading.jpg"),
                _logoImage(),
                Stack(
                  children: [
                    _inputForm(size),
                    _authButton(size),
                    // Container(width: 100, height: 50, color: Colors.black),
                  ],
                ),
                Container(height: size.height * 0.05),
                Consumer<JoinOrLogin>(
                  builder: (context, joinOrLogin, child) =>
                    GestureDetector(
                    onTap: () {
                      JoinOrLogin joinOrLogin = Provider.of<JoinOrLogin>(context, listen: false);
                      joinOrLogin.toggle();
                    },
                    child: Text(joinOrLogin.isJoin? 'Already Have an Account? Sign In' : 'Sign Up',
                      style: TextStyle(color: joinOrLogin.isJoin?Colors.red:Colors.blue))
                  ),
                ),
                Container(height: size.height * 0.05),
              ],
            )
          ],
        )
    );
  }

  Widget _logoImage() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/200")
          ),
        ),
      ),
    );
  }

  Widget _authButton(Size size) {
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: Consumer<JoinOrLogin>(
          builder: (context, joinOrLogin,child) =>
            RaisedButton(
            child: Text(joinOrLogin.isJoin ? "Join" : "Login", style: TextStyle(color: Colors.white, fontSize: 20)),
            color: joinOrLogin.isJoin ? Colors.red : Colors.blue,
            onPressed: () => {
              if (_formKey.currentState!.validate()) {
                print("button pressed")
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width*0.06),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 16.0, bottom: 23.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Please input correct Email.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Please input correct Password.";
                    }
                    return null;
                  },
                ),
                Container(height: 18,),
                Consumer<JoinOrLogin>(
                  builder: (context, joinOrLogin, child) =>
                    Opacity(
                        opacity: joinOrLogin.isJoin ? 0 : 1.0,
                        child: Text("Forgot Password")
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
