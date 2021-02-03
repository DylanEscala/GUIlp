import 'package:flutter/material.dart';

import 'package:proyectolp/src/pages/FormSubmitPetPage.dart';
import 'package:proyectolp/src/pages/managerhomepage.dart';
import 'package:proyectolp/src/pages/historialPage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  final String title = "Menú Principal";

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainPage> {
  void showhistorial() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => historialPage()));
  }

  void _redirDarAdopcion(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormSubmitPetPage()));
  }

  void _redirAdoptar(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ManagerHomePage()));
  }

  List<Widget> botones(BuildContext context) {
    Widget botonPonerEnAdopcion = SizedBox(width: 200,child:RaisedButton(
      onPressed: () {
        _redirDarAdopcion(context);
      },
      child: Text('Poner En Adopcion'),
      color: Colors.green,
      textColor: Colors.white,
    ));
    Widget botonAdoptar = SizedBox(width: 200,child:RaisedButton(
      onPressed: () {
        _redirAdoptar(context);
      },
      child: Text('Adoptar'),
      color: Colors.green,
      textColor: Colors.white,
    ));
    ;
    Widget botonCerrar = SizedBox(width: 200,child:RaisedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('Cerrar sesion'),
      color: Colors.red,
      textColor: Colors.white,
    ));
    Widget botonhistorial = SizedBox(width: 200,child:RaisedButton(
      onPressed: () {
        showhistorial();
      },
      child: Text('Historial Adopcion'),
      color: Colors.green,
      textColor: Colors.white,
    ));
    List<Widget> lista = [
      botonPonerEnAdopcion,
      botonAdoptar,
      botonhistorial,
      botonCerrar
    ];
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: (botones(context)),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
