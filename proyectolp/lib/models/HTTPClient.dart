import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectolp/models/Pet.dart';

class HTTPClient{
  HTTPClient._internal();

  factory HTTPClient(){
    return _instance;
  }

  static final HTTPClient _instance = new HTTPClient._internal();

  final String _enlace="http://df46bc2ffdff.ngrok.io/api/v1/";

  String authToken;

  Map<String,String> _getRequestHeaders(){
    return {
      'Authorization': '$authToken',
      'Content-Type': 'application/json'
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
      authToken=resp['auth_token'];
      print(authToken);
      return true;
    }
  }

    Future<List<Pet>> verMascotas() async{
      List<Pet> list = [];
      final response = await http.get(_enlace+"pets", headers: _getRequestHeaders());
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