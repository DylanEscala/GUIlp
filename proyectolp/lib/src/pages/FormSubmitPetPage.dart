import 'package:flutter/material.dart';
import 'package:proyectolp/models/HTTPClient.dart';
import 'package:proyectolp/models/Pet.dart';
import 'package:proyectolp/src/pages/RegistroPetPage.dart';

class FormSubmitPetPage extends StatefulWidget {
  FormSubmitPetPage({Key key}) : super(key: key);
  final String title = "Registrar Mascota";

  @override
  _FormSubmitPetState createState() => _FormSubmitPetState();
}

class _FormSubmitPetState extends State<FormSubmitPetPage> {
  void _redirConfirmation(Pet animal,BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegistroPetPage(animal)));
  }
  void submitpet(BuildContext context) {
    Pet pet = Pet(_especieTexto, _raza.text, int.parse(_edad.text),
        _genero.text, _nombre.text, 0);
    HTTPClient().subirMascota(pet);
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
                  height: 275,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconTheme(
                                child: Icon(Icons.check),
                                data: IconThemeData(
                                    color: Colors.lightGreen, size: 20.0)),
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
                          print("hola");
                          Navigator.pop(context, 'dialog');
                        },
                        child: Text('Aceptar'),
                        color: Colors.green,
                        textColor: Colors.white,
                      )
                    ],
                  )));
        });
  }

  TextEditingController _raza = TextEditingController();
  TextEditingController _nombre = TextEditingController();
  TextEditingController _edad = TextEditingController();
  TextEditingController _genero = TextEditingController();
  String _especieTexto;
  @override
  List<Widget> crearhijos(BuildContext context) {
    List<Widget> wid = [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 200,
                  height: 40,
                  child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        items: Pet.animalesNormales.map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(
                                value[0].toUpperCase() + value.substring(1)),
                          );
                        }).toList(),
                        value: _especieTexto,
                        onChanged: (String newValue) {
                          setState(() {
                            _especieTexto = newValue;
                            print(_especieTexto);
                          });
                        },
                        hint: Text("Especie"),
                      ))),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 40,
                child: TextField(
                  controller: _raza,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Raza'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 40,
                child: TextField(
                  controller: _nombre,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Nombre'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 40,
                child: TextField(
                  controller: _edad,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Edad'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 40,
                child: TextField(
                  controller: _genero,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Genero'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  Pet pet = Pet(_especieTexto, _raza.text, int.parse(_edad.text),
                      _genero.text, _nombre.text, 0);
                  _redirConfirmation(pet,context);
                },
                child: Text('Poner en Adopcion'),
                color: Colors.green,
                textColor: Colors.white,
              )
            ],
          ),
        ],
      )
    ];
    return wid;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => {Navigator.pop(context)},
          ),
        ),
        body: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: crearhijos(context),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
