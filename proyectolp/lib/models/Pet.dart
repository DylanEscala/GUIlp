class Pet{
  String especie;
  String raza;
  int edad;
  String genero;
  String nombre;
  int id;
  Pet(this.especie, this.raza, this.edad, this.genero, this.nombre,this.id);
  static List<String> animalesNormales = ["perro","gato","hamster", "loro","sapo"];
  static bool animalConocido(String animal){
    return animalesNormales.contains(animal);
  }
}