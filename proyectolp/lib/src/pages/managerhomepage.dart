import 'package:flutter/material.dart';
import 'package:proyectolp/models/Pet.dart';
import 'package:proyectolp/widgets/PetWidget.dart';



class ManagerHomePage extends StatefulWidget {
  ManagerHomePage({Key key}) : super(key: key);
  final String title = "Ver mascotas";

  @override
  _ManagerHomeState createState() => _ManagerHomeState();
}

class _ManagerHomeState extends State<ManagerHomePage> {
  List<Widget> consultarMascotas(){
    Pet mascota1 = Pet("gato", "nuse", 1, "no binario", "gatx",1);
    PetWidget petprueba= new PetWidget(mascota1);
    Pet mascota2 = Pet("hamster", "nuse", 1, "no binario", "gatx",1);
    PetWidget petprueba2= new PetWidget(mascota2);
    Pet mascota3 = Pet("hamster", "nuse", 1, "no binario", "gatx",1);
    PetWidget petprueba3= new PetWidget(mascota2);
    List<Widget> lista = [petprueba.widgepantallainicio(context),petprueba2.widgepantallainicio(context),petprueba3.widgepantallainicio(context),petprueba.widgepantallainicio(context),petprueba3.widgepantallainicio(context)];
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
        child: ListView(scrollDirection: Axis.vertical,shrinkWrap: true,
          children: (consultarMascotas()),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
