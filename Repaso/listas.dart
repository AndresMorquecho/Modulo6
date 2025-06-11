void main() {
  List<String> ciudades = ['Quito', 'Guayaquil', 'Cuenca', 'Loja', 'Quito'];

  print(ciudades);
  ciudades.add('Esmeraldas');
  print(ciudades[1]);
  print(ciudades);

  ciudades.remove("Esmeraldas");
  print(ciudades);

  List<List<int>> numeros = [
    [1, 2, 3],
    [4, 5, 6],
  ];

  print(numeros[0][1]);

  List<Ciudad> ciudadesObj = [
    Ciudad(nombre: 'Quito', poblacion: '200'),
    Ciudad(nombre: 'Ambato', poblacion: '200'),
    Ciudad(nombre: 'Riobamba', poblacion: '200'),
  ];

  print(ciudadesObj[0].nombre);
  print(ciudadesObj[0].poblacion);

  ciudadesObj.add(Ciudad(nombre: 'Loja', poblacion: '200'));

  for(var obj in ciudadesObj){
    print(obj.nombre);
  }
}

class Ciudad {
  String? nombre;
  String? poblacion;

  Ciudad({this.nombre, this.poblacion});
}
