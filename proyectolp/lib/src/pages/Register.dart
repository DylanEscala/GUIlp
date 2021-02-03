import 'package:flutter/material.dart';
import 'package:proyectolp/models/HTTPClient.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);
  final String title = "Registrar Usuario";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {

  void crearusuario() async{
    bool respuestaservidor = await HTTPClient().subirUsuario(_username.text, _password.text, _correo.text);
    if ((_password.text != _confirmationpassword.text) ||  !(respuestaservidor)) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                content: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Center(child:ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            //mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconTheme(
                                  child: Icon(Icons.error_outline),
                                  data: IconThemeData(
                                      color: Colors.red, size: 60.0)),
                              //SizedBox(width: 30),
                              Text('Usuario No Creado'),

                              RaisedButton(
                                onPressed: () {
                                  Navigator.pop(context, 'dialog');
                                },
                                child: Text('Cerrar'),
                                color: Colors.green,
                                textColor: Colors.white,
                              )
                            ],
                          )
                        ]))));
          });
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                content: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Center(child:ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            //mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconTheme(
                                  child: Icon(Icons.check),
                                  data: IconThemeData(
                                      color: Colors.lightGreen, size: 60.0)),
                              //SizedBox(width: 30),
                              Text('Usuario Creado Satisfactoriamente'),

                              RaisedButton(
                                onPressed: () {
                                  Navigator.pop(context, 'dialog');
                                },
                                child: Text('Cerrar'),
                                color: Colors.green,
                                textColor: Colors.white,
                              )
                            ],
                          )
                        ]))));
          });
    }
  }

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmationpassword = TextEditingController();
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
                  controller: _correo,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Correo'),
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
                      border: OutlineInputBorder(), labelText: 'Clave'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: TextField(
                  controller: _confirmationpassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirmar Clave'),
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
