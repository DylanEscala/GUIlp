import 'package:flutter/material.dart';
import 'package:proyectolp/src/pages/PetWidget.dart';



class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainPage> {
  void iraadoptar(){

  }
  List<Widget> botones(){
    Widget botonPonerEnAdopcion= RaisedButton(onPressed: (){iraadoptar();},child: Text('Adoptar'),color: Colors.green,textColor: Colors.white,);
    Widget botonAdoptar= RaisedButton(onPressed: (){iraadoptar();},child: Text('Poner En Adopcion'),color: Colors.green,textColor: Colors.white,);;
    List<Widget> lista = [botonPonerEnAdopcion,botonAdoptar];
    /*llamada funcion que retorna lista de WidgetPet
    widgetpets()
    for (PetWidget mascota in null){
      lista.add(mascota.widgepantallainicio())
    }
    */
    //const SizedBox(width: 8),
    return lista;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
