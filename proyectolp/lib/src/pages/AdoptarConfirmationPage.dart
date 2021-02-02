import 'package:flutter/material.dart';
import 'package:proyectolp/main.dart';
import 'package:proyectolp/models/Adopcion.dart';
import 'package:proyectolp/models/HTTPClient.dart';
import 'package:proyectolp/models/Pet.dart';
import 'package:proyectolp/widgets/PetWidget.dart';

class AdoptarConfirmationPage extends StatefulWidget {
  Pet selected;
  AdoptarConfirmationPage(this.selected, {Key key}) : super(key: key);
  final String title = "Ver mascotas";

  @override
  _AdoptarConfirmationState createState() => _AdoptarConfirmationState();
}

class _AdoptarConfirmationState extends State<AdoptarConfirmationPage> {
  List<Widget> consultarhistorial() {
    Pet mascota1 = widget.selected;
    PetWidget petprueba = new PetWidget(mascota1);
    List<Widget> lista = [
      petprueba.confirmar(),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        RaisedButton(
          onPressed: () async {
            Adopcion a = await HTTPClient().encontrarAdopcionPet(mascota1);
            HTTPClient().actualizarAdopcion(a);
            Navigator.pop(context);
          },
          child: Text('Adoptar'),
          color: Colors.green,
          textColor: Colors.white,
        ),
        SizedBox(width: 30),
        RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancelar'),
          color: Colors.red,
          textColor: Colors.white,
        )
      ])
    ];
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
