import 'package:flutter/material.dart';
import 'package:proyectolp/widgets/PetWidget.dart';



class FormSubmitPetPage extends StatefulWidget {
  FormSubmitPetPage({Key key}) : super(key: key);
  final String title="Registrar Mascota";

  @override
  _FormSubmitPetState createState() => _FormSubmitPetState();
}
void submitpet(String especie,String raza,String nombre, int edad, String genero){
  //subir el animal
}
class _FormSubmitPetState extends State<FormSubmitPetPage> {
  void subirmascota(){

  }
  @override
  List<Widget> crearhijos(){
    TextEditingController _especie=TextEditingController();
    TextEditingController _raza=TextEditingController();
    TextEditingController _nombre=TextEditingController();
    TextEditingController _edad=TextEditingController();
    TextEditingController _genero=TextEditingController();
    List<Widget> wid=[Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      Column(mainAxisAlignment: MainAxisAlignment.start,children: [
        Container(width: 200,height: 40, child: TextField(controller: _especie,decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Especie'),),),
        SizedBox(height: 20,),
        Container(width: 200,height: 40, child:TextField(controller: _raza,decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Raza'),),),
        SizedBox(height: 20,),
        Container(width: 200,height: 40, child:TextField(controller: _nombre,decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Nombre'),),),
        SizedBox(height: 20,),
        Container(width: 200,height: 40, child:TextField(controller: _edad,decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Edad'),),),
        SizedBox(height: 20,),
        Container(width: 200,height: 40, child:TextField(controller: _genero,decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Genero'),),),
        SizedBox(height: 20,),
        RaisedButton(onPressed: (){submitpet(_especie.text,_raza.text,_nombre.text,int.parse(_edad.text),_genero.text);},child: Text('Poner en Adopcion'),color: Colors.green,textColor: Colors.white,)
      ],),
    ],
    )];
    return wid;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(scrollDirection: Axis.vertical,shrinkWrap: true,
        children: crearhijos(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      ));
  }
}
