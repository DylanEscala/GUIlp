import 'package:flutter/material.dart';
import 'package:proyectolp/main.dart';
import 'package:proyectolp/models/Pet.dart';
import 'package:proyectolp/widgets/PetWidget.dart';



class AdoptarConfirmationPage extends StatefulWidget {
  static Pet selected;
  AdoptarConfirmationPage({Key key}) : super(key: key);
  final String title = "Ver mascotas";

  @override
  _AdoptarConfirmationState createState() => _AdoptarConfirmationState();
}

class _AdoptarConfirmationState extends State<AdoptarConfirmationPage> {
  List<Widget> consultarhistorial(){
    Pet mascota1 = AdoptarConfirmationPage.selected;
    PetWidget petprueba= new PetWidget(mascota1);
    List<Widget> lista = [petprueba.confirmar(),Row(mainAxisAlignment: MainAxisAlignment.center,children: [RaisedButton(onPressed: (){},child: Text('Adoptar'),color: Colors.green,textColor: Colors.white,),SizedBox(width: 30),RaisedButton(onPressed: (){Navigator.pop(context);},child: Text('Cancelar'),color: Colors.red,textColor: Colors.white,)])];
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
          children: (consultarhistorial()),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
