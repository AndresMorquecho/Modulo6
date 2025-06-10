class Persona {
  String? nombre;
  int edad=0;
  double? estatura;

  Persona(this.nombre, this.edad, this.estatura);
}

void main(){
  Persona p;
  p = new Persona("Andres",26,1.70);

  print("Nombre: ${p.nombre}");
  print("Nombre: ${p.edad}");
  print("Nombre: ${p.estatura}");
}
