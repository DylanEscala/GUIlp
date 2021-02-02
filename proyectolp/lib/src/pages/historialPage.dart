import 'package:flutter/material.dart';
import 'package:proyectolp/models/Pet.dart';
import 'package:proyectolp/widgets/PetWidget.dart';

class historialPage extends StatefulWidget {
  historialPage({Key key}) : super(key: key);
  final String title = "Ver mascotas";

  @override
  _historialState createState() => _historialState();
}

class _historialState extends State<historialPage> {
  List<Widget> consultarhistorial() {
    Pet mascota1 = Pet("sapo", "nuse", 1, "no binario", "gatx", 1);
    PetWidget petprueba = new PetWidget(mascota1);
    Pet mascota2 = Pet("hamster", "nuse", 1, "no binario", "gatx", 1);
    PetWidget petprueba2 = new PetWidget(mascota2);
    Pet mascota3 = Pet("hamster", "nuse", 1, "no binario", "gatx", 1);
    PetWidget petprueba3 = new PetWidget(mascota2);
    List<Widget> lista = [
      SizedBox(
        height: 20.0,
      ),
      petprueba.informacionhistorial(context),
      petprueba2.informacionhistorial(context),
      SizedBox(
        height: 20.0,
      ),
      petprueba3.informacionhistorial(context),
      SizedBox(
        height: 20.0,
      ),
      petprueba.informacionhistorial(context),
      petprueba3.informacionhistorial(context)
    ];
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
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: (consultarhistorial()),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
