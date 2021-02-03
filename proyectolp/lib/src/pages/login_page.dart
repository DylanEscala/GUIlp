import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyectolp/models/HTTPClient.dart';
import 'package:proyectolp/src/pages/MainPage.dart';
import 'package:proyectolp/src/pages/Register.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Inicio de Sesión"),
          automaticallyImplyLeading: true,
          /*leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => {Navigator.pop(context)},
          ),*/
        ),
        body: Center(
          /*Center(
            child: ListView(scrollDirection: Axis.vertical,shrinkWrap: true,
              children: (consultarMascotas()),
            ),
          ),*/
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Container(
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
              SizedBox(
                height: 20.0,
              ),
              Visibility(
                  visible: _isVisible,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 35.0),
                      child: Text(
                        "Error, no pudo iniciar sesión",
                        style: TextStyle(color: Colors.red),
                      ))),
              SizedBox(height: 10.0),
              _bottonLogin(),
              SizedBox(
                height: 10.0,
              ),
              _bottonRegister(),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottonLogin() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: RaisedButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
                child: Text(
                  "Iniciar Sesion",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10.0,
              color: Colors.lightGreen,
              onPressed: () async {
                bool pudoIngresar = await HTTPClient()
                    .login(emailController.text, passController.text);
                if (pudoIngresar) {
                  setState(() {
                    _isVisible = false;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                } else {
                  setState(() {
                    _isVisible = true;
                  });
                }
              },
            ));
      },
    );
  }

  Widget _bottonRegister() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: RaisedButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                child: Text(
                  "Registrar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10.0,
              color: Colors.blueAccent,
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
            ));
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
                icon: Icon(Icons.person),
                hintText: "Nombre de usuario",
                labelText: "Nombre de usuario",
              ),
              onChanged: (value) {},
            ));
      },
    );
  }
}
