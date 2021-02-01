import 'package:flutter/material.dart';

import 'package:proyectolp/src/pages/FormSubmitPetPage.dart';
import 'package:proyectolp/src/pages/managerhomepage.dart';
import 'package:proyectolp/src/pages/historialPage.dart';






class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  final String title="Menú Principal";

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainPage> {
  void showhistorial(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => historialPage())
    );
  }
  void _redirDarAdopcion(BuildContext context){

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormSubmitPetPage())
    );
  }

  void _redirAdoptar(BuildContext context){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ManagerHomePage())
    );
  }

  List<Widget> botones(BuildContext context){
    Widget botonPonerEnAdopcion= RaisedButton(onPressed: (){_redirDarAdopcion(context);},child: Text('Poner En Adopcion'),color: Colors.green,textColor: Colors.white,);
    Widget botonAdoptar= RaisedButton(onPressed: (){_redirAdoptar(context);},child: Text('Adoptar'),color: Colors.green,textColor: Colors.white,);
    Widget historial= RaisedButton(onPressed: (){showhistorial();},child: Text('Historial Adopcion'),color: Colors.green,textColor: Colors.white,);;
    List<Widget> lista = [botonPonerEnAdopcion,botonAdoptar,historial];
    return lista;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => {Navigator.pop(context)},
        ),
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
