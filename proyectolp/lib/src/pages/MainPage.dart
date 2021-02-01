import 'package:flutter/material.dart';
//import 'package:proyectolp/widgets/PetWidget.dart';



class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainPage> {
  void iraadoptar(){
  }
  void iradopcion(){

  }
  List<Widget> botones(){
    Widget botonPonerEnAdopcion= RaisedButton(onPressed: (){iradopcion();},child: Text('Adoptar'),color: Colors.green,textColor: Colors.white,);
    Widget botonAdoptar= RaisedButton(onPressed: (){iraadoptar();},child: Text('Poner En Adopcion'),color: Colors.green,textColor: Colors.white,);;
    List<Widget> lista = [botonPonerEnAdopcion,botonAdoptar];
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
