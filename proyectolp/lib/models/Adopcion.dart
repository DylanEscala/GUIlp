import 'package:proyectolp/models/HTTPClient.dart';
import 'package:proyectolp/models/Pet.dart';

class Adopcion{
  int donante;
  int adopter;
  int petId;
  Pet pet;
  int id;

  void asignarMascota() async{
    pet = await HTTPClient().obtenerMascota(petId);
}

  Adopcion(this.donante, this.adopter, this.petId, this.id){
    asignarMascota();
  }


  factory Adopcion.fromJSON(json){
    return Adopcion(json['donante_id'], json['adopter_id'], json['pets_id'], json['id']);
  }

}