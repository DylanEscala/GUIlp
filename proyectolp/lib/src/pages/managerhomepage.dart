import 'package:flutter/material.dart';
import 'package:proyectolp/src/pages/PetWidget.dart';



class ManagerHomePage extends StatefulWidget {
  ManagerHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ManagerHomeState createState() => _ManagerHomeState();
}

class _ManagerHomeState extends State<ManagerHomePage> {
  List<Widget> consultarMascotas(){
    PetWidget petprueba= new PetWidget("gato", "nuse", 1, "no binario", "gatx",1);
    PetWidget petprueba2= new PetWidget("hamster", "nuse", 1, "no binario", "gatx",1);
    List<Widget> lista = [petprueba.widgepantallainicio(context),petprueba2.widgepantallainicio(context),];
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
          children: (consultarMascotas()),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
