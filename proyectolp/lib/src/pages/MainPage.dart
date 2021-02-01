import 'package:flutter/material.dart';



class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainPage> {
  void showhistorial(){
  }
  void iraadoptar(){
  }
  void iradopcion(){

  }
  List<Widget> botones(){
    Widget botonPonerEnAdopcion= RaisedButton(onPressed: (){iradopcion();},child: Text('Adoptar'),color: Colors.green,textColor: Colors.white,);
    Widget botonAdoptar= RaisedButton(onPressed: (){iraadoptar();},child: Text('Poner En Adopcion'),color: Colors.green,textColor: Colors.white,);
    Widget historial= RaisedButton(onPressed: (){showhistorial();},child: Text('Historial Adopcion'),color: Colors.green,textColor: Colors.white,);;
    List<Widget> lista = [botonPonerEnAdopcion,botonAdoptar,historial];
    return lista;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title),
        title: Text("Main"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: (botones()),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
