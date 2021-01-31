import 'package:flutter/material.dart';
class ViewPage {
  Widget ViewPageMethod(String especie,  String raza,  int edad,  String genero,  String nombre, String imagen){
    Widget mainrow = Column(children: <Widget>[Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget> [
      Image(width: 100,height: 100,image: AssetImage(imagen)),
      SizedBox(width: 30),
      Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
        Text('Nombre'),
        Text(nombre),
        Text('Especie'),
        Text(especie),
        Text('Raza'),
        Text(raza.toString()),
        Text('Edad'),
        Text(edad.toString()),
        Text('Genero'),
        Text(genero.toString()),
        ],
      )]
    ),Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
      RaisedButton(onPressed: (){cerrar();},child: Text('Cerrar'),color: Colors.green,textColor: Colors.white,),
    ],)]);
    return mainrow;
  }
  void cerrar(){

  }
}