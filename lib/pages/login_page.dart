import 'package:awesome_flutter/bg_image.dart';
import 'package:awesome_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page")
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BgImage(),
          Center(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Card(
                child: Column(
                children: <Widget>[
                  Form(child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username"
                        )
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password"
                        )
                      ),
                    ] 
                    ),
                  )),
                  SizedBox(height: 20),
                  RaisedButton(
                    onPressed: () {
                      Constants.prefs.setBool("loggedIn", true);
                      Navigator.pushReplacementNamed(context, "/home");
                    },
                    child: Text("Sign In"),
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 20),
                ]
              ),
            )
        ),
      ),)
        ]
      )
    );
  }
}