import 'package:flutter/material.dart';
class PetWidget {
  String especie;
  String raza;
  int edad;
  String genero;
  String nombre;
  String imagen;
  int id;
  PetWidget(String especie, String raza, int edad, String genero, String nombre,int id){
    this.especie=especie;
    this.edad=edad;
    this.raza=raza;
    this.genero=genero;
    this.nombre=nombre;
    setimagen();
    this.id=id;
  }
  void adoptar(){
    //mandar datos al host y actualizar
  }
  Widget widgepantallainicio(){
    Widget mainrow = Column(children: <Widget>[Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget> [
      Image(width: 100,height: 100,image: AssetImage(imagen)),
      SizedBox(width: 30),
      Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
        Text('Nombre'),
        Text(nombre),
        Text('Especie'),
        Text(especie),
        Text('Edad'),
        Text(edad.toString())],
    )]
    ),Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
      RaisedButton(onPressed: (){adoptar();},child: Text('Ver'),color: Colors.green,textColor: Colors.white,),
      SizedBox(width: 10),
      RaisedButton(onPressed: (){adoptar();},child: Text('Adoptar'),color: Colors.green,textColor: Colors.white,)],)]);
    return mainrow;
  }
  void  setimagen(){
  try{
    imagen='images/'+especie+'.png';
  }catch (e){
    imagen='images/otro.jpg';
  }
  }
}