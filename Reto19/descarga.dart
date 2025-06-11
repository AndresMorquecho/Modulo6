void main() {
  print("Veo una pelicula");
  print("Aprovecho para descargar un juego pesado");
  veoPelicula();
}

Future<String> descargar() {
  print("Empieza descarga 0%");
  return Future.delayed(Duration(seconds: 2), () => "Descarga Completa 100%");
}

void veoPelicula()async{
  print("Veo una pelicula");
  final estado = await descargar();
  print(estado);
  print("Termino de ver la pelicula y tengo mi juego descargado"); 
}
