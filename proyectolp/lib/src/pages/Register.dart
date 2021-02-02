import 'package:flutter/material.dart';
import 'package:proyectolp/models/HTTPClient.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);
  final String title = "Registrar Mascota";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  void crearusuario() {
    HTTPClient().subirUsuario(_username.text, _password.text, _correo.text);
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
                  height: 275,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.check),
                              color: Colors.lightGreen,
                              iconSize: 20.0,
                            ),
                            SizedBox(width: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('Usuario creado satisfactoriamente'),
                              ],
                            )
                          ]),
                      RaisedButton(
                        onPressed: () {
                          print("hola");
                          Navigator.pop(context, 'dialog');
                        },
                        child: Text('Aceptar'),
                        color: Colors.green,
                        textColor: Colors.white,
                      )
                    ],
                  )));
        });
  }

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _correo = TextEditingController();

  @override
  List<Widget> crearhijos() {
    List<Widget> wid = [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: TextField(
                  controller: _username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre de Usario'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Contrasena'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: TextField(
                  controller: _correo,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Correo'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  crearusuario();
                },
                child: Text('Registrar'),
                color: Colors.green,
                textColor: Colors.white,
              )
            ],
          ),
        ],
      )
    ];
    return wid;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: crearhijos()),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
