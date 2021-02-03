import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectolp/models/Pet.dart';

import 'Adopcion.dart';

class HTTPClient{
  HTTPClient._internal();
  int _userID;

  factory HTTPClient(){
    return _instance;
  }

  static final HTTPClient _instance = new HTTPClient._internal();

  final String _enlace="http://1dcd5128e658.ngrok.io/api/v1/";

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

      var body2Encoded = jsonEncode(<String, String> {
        'donante_id': _userID.toString(),
        'pets_id': jsonDecode(response.body)['id'],
        'adopter_id': null
      });

      final response2 = await http.post(_enlace+'adopcions', body: body2Encoded, headers: _getRequestHeaders());

      print(response2.body);
      
    }

  Future<Adopcion> encontrarAdopcionPet(Pet pet) async {
    final response = await http.get(_enlace+"adopcions?pet="+pet.id.toString(), headers: _getRequestHeaders());

    var jsonD = jsonDecode(response.body.toString())[0];
    print(jsonD['id']);

    return Adopcion.fromJSON(jsonD);
  }

  Future<List<Adopcion>> encontrarAdopcionUserDonante() async {
    final response = await http.get(_enlace+"adopcions?donante="+_userID.toString(), headers: _getRequestHeaders());

    List<Adopcion> list = [];
    var lista = jsonDecode(response.body.toString());
    for(int i=0; i<lista.length;i++){
      list.add(Adopcion.fromJSON(lista[i]));
    }

    return list;
  }

  Future<List<Adopcion>> encontrarAdopcionUserAdopter() async {
    final response = await http.get(_enlace+"adopcions?adopter="+_userID.toString(), headers: _getRequestHeaders());

    List<Adopcion> list = [];
    var lista = jsonDecode(response.body.toString());
    for(int i=0; i<lista.length;i++){
      list.add(Adopcion.fromJSON(lista[i]));
    }

    return list;
  }

  Future<List<Pet>> mascotasUserAdopter() async{
    final lista = await encontrarAdopcionUserAdopter();
    List<Pet> list = [];
    for(int i=0; i<lista.length;i++){
      Pet mascota = await obtenerMascota(lista[i].petId);
      list.add(mascota);
    }
    return list;
  }

  Future<List<Pet>> mascotasUserDonante() async{
    final lista = await encontrarAdopcionUserDonante();
    List<Pet> list = [];
    for(int i=0; i<lista.length;i++){
      Pet mascota = await obtenerMascota(lista[i].petId);
      list.add(mascota);
    }
    return list;
  }

  void actualizarAdopcion(Adopcion a) async {

    var bodyEncoded = jsonEncode(<String, String>{
      'donante_id':a.donante.toString(),
      'pets_id': a.petId.toString(),
      'adopter_id': _userID.toString(),
    });

    final response = await http.put(_enlace+"adopcions/"+a.id.toString(), headers: _getRequestHeaders(), body: bodyEncoded);

    var json = jsonDecode(response.body);

    print(json);
  }

  void finalizarAdopcion(Adopcion a) async {

    var bodyEncoded = jsonEncode(<String, String>{
      'donante_id':a.donante.toString(),
      'pets_id': a.petId.toString(),
      'adopter_id': a.adopter.toString(),
      'entregado': 'entregado'
    });

    final response = await http.put(_enlace+"adopcions/"+a.id.toString(), headers: _getRequestHeaders(), body: bodyEncoded);

    var json = jsonDecode(response.body);

    print(json);
  }


  Future<bool> subirUsuario(String user, String pass, String email) async {
    var bodyEncoded = jsonEncode(<String, String> {
      'username': user,
      'password': pass,
      'password_confirmation': pass,
      'email': email,
    });

    final response = await http.post(_enlace+'users', body: bodyEncoded, headers: _getRequestHeaders());

    print(response.body);
    return response.statusCode>=200 && response.statusCode<400;

  }

  Future<Map<String, dynamic>> obtenerUsuario(int id) async {
    final response = await http.get(_enlace+"users/"+id.toString(), headers: _getRequestHeaders());
    var json = jsonDecode(response.body)[0];
    return json;
  }
  
}