class Pet{
  String especie;
  String raza;
  int edad;
  String genero;
  String nombre;
  int id;
  Pet(this.especie, this.raza, this.edad, this.genero, this.nombre,this.id);
  static List<String> animalesNormales = ["perro","gato","hamster", "loro", "otro"];
  static bool animalConocido(String animal){
    return animalesNormales.contains(animal);
  }

  factory Pet.fromJSON(json){
    return Pet(json['type_of_pet'],json['breed'],json['age'],json['gender'],json['name'],json['id']);
  }
}