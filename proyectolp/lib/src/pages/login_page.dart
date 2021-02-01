import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyectolp/models/HTTPClient.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Inicio de Sesión"),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => {Navigator.pop(context)},
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  'images/perro.png',
                  height: 300.0,
                ),
              ),
              SizedBox(height: 15.0),
              _userTextField(),
              SizedBox(
                height: 15.0,
              ),
              _passwordTextField(),
              SizedBox(height: 20.0),
              _bottonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottonLogin() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text(
                "Iniciar Sesion",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10.0,
            color: Colors.blueAccent,
            onPressed: () => print(HTTPClient().login(emailController.text, passController.text)),
        );
      },
    );
  }

  Widget _passwordTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: passController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                hintText: "Contraseña",
                labelText: "Contraseña",
              ),
              onChanged: (value) {},
            ));
      },
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "ejemplo@taller.com",
                labelText: "Correo electrónico",
              ),
              onChanged: (value) {},
            ));
      },
    );
  }
}
