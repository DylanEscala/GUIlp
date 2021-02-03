import 'package:flutter/material.dart';
import 'package:proyectolp/models/Pet.dart';
import 'package:proyectolp/src/pages/AdoptarConfirmationPage.dart';
import 'package:proyectolp/src/pages/AdoptarConfirmationPage.dart';

class PetWidget {
  Pet pet;
  String imagen;
  PetWidget(this.pet) {
    setimagen();
  }
  void adoptar(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AdoptarConfirmationPage(this.pet)));
  }

  Widget widgepantallainicio(BuildContext context) {
    Widget mainrow = Column(
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Image(width: 100, height: 100, image: AssetImage(imagen)),
          SizedBox(width: MediaQuery.of(context).size.width * 0.5 - 100),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Text('Nombre: '),
              Text(pet.nombre),
              //Text('\nEspecie: '),
              Text('\n'+pet.especie),
              //Text('\nEdad: '),
              Text('\n'+pet.edad.toString())
            ],
          )
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: RaisedButton(
                onPressed: () {
                  view(context);
                },
                child: Text('Ver'),
                color: Colors.green,
                textColor: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            SizedBox(width: 10),
            Container(
              child: RaisedButton(
                onPressed: () {
                  adoptar(context);
                },
                child: Text('Adoptar'),
                color: Colors.green,
                textColor: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ],
        ),
      ],
    );

    return mainrow;
  }

  void view(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 275,
              width: MediaQuery.of(context).size.width * 0.8,
              //overflow: Overflow.visible,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8.0),
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                  width: 100,
                                  height: 100,
                                  image: AssetImage(imagen)),
                              SizedBox(width: 30),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
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
                              )
                            ]),
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: Text('Cerrar'),
                          color: Colors.green,
                          textColor: Colors.white,
                        )
                      ],
                    )
                  ]),
            ),
          );
        });
  }

  Widget informacionhistorial(BuildContext context) {
    Widget mainrow = Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Image(width: 100, height: 100, image: AssetImage(imagen)),
        SizedBox(width: 30),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Text('Nombre'),
            Text(pet.nombre),
            //Text('\nEspecie'),
            Text('\n'+pet.especie),
            //Text('\nEdad'),
            Text('\n'+pet.edad.toString())
          ],
        )
      ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              view(context);
            },
            child: Text('Ver'),
            color: Colors.green,
            textColor: Colors.white,
          )
        ],
      )
    ]);
    return mainrow;
  }

  Widget confirmar() {
    Widget mainrow = Column(children: <Widget>[
      Text(pet.nombre),
      Image(width: 100, height: 100, image: AssetImage(imagen)),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Especie:'),
            Text('Raza:'),
            Text('Edad:'),
            Text('Genero:'),
          ],
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(pet.especie),
          Text(pet.raza.toString()),
          Text(pet.edad.toString()),
          Text(pet.genero.toString())
        ])
      ])
    ]);
    return mainrow;
  }

  void setimagen() {
    if (Pet.animalesNormales.contains(pet.especie))
      imagen = 'images/' + pet.especie + '.png';
    else
      imagen = 'images/otro.png';
  }
}
