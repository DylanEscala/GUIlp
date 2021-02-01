import 'package:flutter/material.dart';
import 'package:proyectolp/models/Pet.dart';
class PetWidget {
  Pet pet;
  String imagen;
  PetWidget(this.pet){
    setimagen();

  }
  void adoptar(){
    //mandar datos al host y actualizar
  }

  Widget widgepantallainicio(BuildContext context){
    Widget mainrow = Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Image(width: 100,height: 100,image: AssetImage(imagen)),
                SizedBox(width: 30),
                Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
                  Text('Nombre'),
                  Text(pet.nombre),
                  Text('Especie'),
                  Text(pet.especie),
                  Text('Edad'),
                  Text(pet.edad.toString())
                  ],

                )
              ]
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
            RaisedButton(onPressed: (){view(context);},child: Text('Ver'),color: Colors.green,textColor: Colors.white,),
            SizedBox(width: 10),
            RaisedButton(onPressed: (){adoptar();},child: Text('Adoptar'),color: Colors.green,textColor: Colors.white,)
            ],
          )
        ]
    );
    return mainrow;
  }
  void view(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              //overflow: Overflow.visible,
              child: ListView(scrollDirection: Axis.horizontal,shrinkWrap: true,padding: const EdgeInsets.all(8.0),children: <Widget>[
                Column(mainAxisSize: MainAxisSize.min,children: <Widget>[Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget> [
                  Image(width: 100,height: 100,image: AssetImage(imagen)),
                  SizedBox(width: 30),
                  Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
                    Text('Nombre'),
                    Text(pet.nombre),
                    Text('Especie'),
                    Text(pet.especie),
                    Text('Raza'),
                    Text(pet.raza.toString()),
                    Text('Edad'),
                    Text(pet.edad.toString()),
                    Text('Genero'),
                    Text(pet.genero.toString()),
                  ],
                  )]
                ),Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                  RaisedButton(onPressed: (){adoptar();},child: Text('Adoptar'),color: Colors.green,textColor: Colors.white,),
                ],)])
              ]
              ),
            ),
          );
        });
  }

  void  setimagen(){
  if(Pet.animalesNormales.contains(pet.especie))
    imagen='images/'+pet.especie+'.png';
  else
    imagen='images/otro.png';
  }
}