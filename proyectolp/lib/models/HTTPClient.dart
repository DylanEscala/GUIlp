import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectolp/models/Pet.dart';

class HTTPClient{
  HTTPClient._internal();
  int _userID;

  factory HTTPClient(){
    return _instance;
  }

  static final HTTPClient _instance = new HTTPClient._internal();

  final String _enlace="http://df46bc2ffdff.ngrok.io/api/v1/";

  String _authToken;

  Map<String,String> _getRequestHeaders(){
    return {
      'Authorization': '$_authToken',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
  }

  Future<bool> login(String user, String pass) async {

    var bodyEncoded = jsonEncode(<String, String> {
      'username': user,
      'password': pass,
    });

    final response = await http.post(_enlace+"authenticate", body: bodyEncoded, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    var resp = jsonDecode(response.body);
    if(resp['error']!=null) {
      print("Error");
      return false;
    }
    else{
      _authToken=resp['token'];
      _userID = resp['user_id'];
      return true;
    }
  }

  Future<Pet> obtenerMascota(int id) async{
    final response = await http.get(_enlace+"pets/"+id.toString(), headers: _getRequestHeaders());
    var json = jsonDecode(response.body);
    return Pet.fromJSON(json);
  }

    Future<List<Pet>> verMascotas() async{
      List<Pet> list = [];
      final response = await http.get(_enlace+"pets?adopted=false", headers: _getRequestHeaders());
      var lista = jsonDecode(response.body);
      print(response.body);
      for(int i=0; i<lista.length;i++){
        list.add(Pet.fromJSON(lista[i]));
        print(lista[i]);
      }
      return list;
    }


    void subirMascota(Pet pet) async {
      var bodyEncoded = jsonEncode(<String, String> {
        'type_of_pet': pet.especie,
        'breed': pet.raza,
        'name': pet.nombre,
        'age': pet.edad.toString(),
        'gender': pet.genero
      });
      
      final response = await http.post(_enlace+'pets', body: bodyEncoded, headers: _getRequestHeaders());

      print(response.body);

      var body2Encoded = jsonEncode(<String, dynamic> {
        'donante_id': _userID,
        'pets_id': jsonDecode(response.body)['id'],
        'adopter_id': null
      });

      final response2 = await http.post(_enlace+'adopcions', body: body2Encoded, headers: _getRequestHeaders());

      print(response2.body);
      
    }

  void subirUsuario(String user, String pass, String email) async {
    var bodyEncoded = jsonEncode(<String, String> {
      'username': user,
      'password': pass,
      'password_confirmation': pass,
      'email': email,
    });

    final response = await http.post(_enlace+'users', body: bodyEncoded, headers: _getRequestHeaders());

    print(response.body);

  }
  
}